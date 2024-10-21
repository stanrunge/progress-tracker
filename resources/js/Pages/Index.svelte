<script>
    export let tasks;
</script>

<h1 class="text-3xl font-bold text-center my-8">
    Progress Tracker ({tasks.length} tasks)
</h1>

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
                    <select name="type" id="">
                        <option value="book">Book</option>
                        <option value="course">Course</option>
                        <option value="project">Project</option>
                    </select>
                </th>
                <th><input name="name" type="text" /></th>
                <th><input name="progress" type="text" /></th>
                <th
                    ><button
                        class="bg-black hover:bg-gray-800 text-white font-bold py-2 px-4 rounded"
                        on:click={() => {
                            console.log("Save");
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
