<script lang="ts">
    import { useForm, Link } from "@inertiajs/svelte";

    let form = useForm({
        type: "book",
        name: "",
        progress: "",
    });

    function handleSubmit() {
        $form.post("/tasks");
    }

    export let tasks;
    export let auth;

    console.log(auth);
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
            <tr>
                <th>
                    <select bind:value={$form.type}>
                        <option value="book">Book</option>
                        <option value="course">Course</option>
                        <option value="project">Project</option>
                    </select>
                </th>
                <th><input bind:value={$form.name} type="text" /></th>
                <th><input bind:value={$form.progress} type="text" /></th>
                <th
                    ><button
                        class="bg-black hover:bg-gray-800 text-white font-bold py-2 px-4 rounded"
                        on:click={() => {
                            handleSubmit();
                        }}>Save</button
                    ></th
                >
            </tr>
            {#each tasks as task}
                <tr>
                    <th>Book</th>
                    <th>{task.name}</th>
                    <th>200 / 800 (25.00%)</th>
                    <th>
                        <button> Edit </button>
                        <button>Delete</button>
                    </th>
                </tr>
            {/each}
        </tbody>
    </table>
</div>
