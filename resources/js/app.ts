import "../css/app.css";
import "./bootstrap";

import { createInertiaApp } from "@inertiajs/svelte";

const appName = import.meta.env.VITE_APP_NAME || "Progress Tracker";

createInertiaApp({
    title: (title) => {
        `${title} - ${appName}`;
    },
    resolve: (name) => {
        const pages = import.meta.glob("./Pages/**/*.svelte", { eager: true });
        return pages[`./Pages/${name}.svelte`];
    },
    setup({ el, App, props }) {
        new App({ target: el, props });
    },
});
