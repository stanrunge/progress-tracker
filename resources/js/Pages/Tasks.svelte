<script lang="ts">
    import { useForm, Link } from "@inertiajs/svelte";

    let form = useForm({
        type: 1,
        name: "",
        progress_items: 0,
        total_items: 0,
    });

    function handleSubmit() {
        $form.post("/tasks");
    }

    export let tasks;
    export let auth;

    function getTaskType(id: number) {
        switch (id) {
            case 1:
                return "Book";
                break;
            case 2:
                return "Course";
            default:
                return "";
        }
    }
</script>

<div class="flex justify-around">
    <div></div>

    <h1 class="text-3xl font-bold text-center my-8">
        Progress Tracker ({tasks.length} tasks)
    </h1>

    <div class="content-center">
        {#if auth.user}
            <div
                class="flex items
            -center"
            >
                <img
                    src={auth.user.profile_photo_url}
                    alt="Profile Photo"
                    class="rounded-full h-10 w-10"
                />
                <span class="ml-2">{auth.user.name}</span>
            </div>
        {:else}
            <Link href="/login">
                <button
                    class="bg-blue-500 rounded py-2 px-4 text-white font-bold"
                >
                    Log In
                </button>
            </Link>

            <Link href="/register">
                <button
                    class="border-2 border-black rounded py-2 px-4 font-bold"
                >
                    Register
                </button>
            </Link>
        {/if}
    </div>
</div>

<div class="flex justify-center">
    <form on:submit|preventDefault={handleSubmit}>
        <table>
            <thead>
                <tr>
                    <th scope="col">Type</th>
                    <th scope="col">Name</th>
                    <th scope="col">Progress</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr class="border-b">
                    <th>
                        <select bind:value={$form.type}>
                            <option value={1}>Book</option>
                            <option value={2}>Course</option>
                            <option value={3}>Project</option>
                        </select>
                    </th>
                    <th><input bind:value={$form.name} type="text" /></th>
                    <th
                        ><input
                            bind:value={$form.progress_items}
                            type="number"
                        /><input
                            type="number"
                            bind:value={$form.total_items}
                        /></th
                    >
                    <th
                        ><button
                            class="bg-black hover:bg-gray-800 text-white font-bold py-2 px-4 rounded"
                            >Save</button
                        ></th
                    >
                </tr>
                {#each tasks as task}
                    <tr class="border-b">
                        <th>{getTaskType(task.type)}</th>
                        <th>{task.name}</th>
                        <th
                            >{task.progress_items} / {task.total_items} ({Math.round(
                                (task.progress_items / task.total_items) * 100,
                            )}%)</th
                        >
                        <th>
                            <button>Edit</button>
                            <button>Delete</button>
                        </th>
                    </tr>
                {/each}
            </tbody>
        </table>
    </form>
</div>
