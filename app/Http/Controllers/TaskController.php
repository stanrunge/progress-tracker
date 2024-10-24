<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class TaskController extends Controller
{
    public function index(User $user): Response
    {
        return Inertia::render('Tasks', [
            'tasks' => $user->tasks,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([

            'name' => 'required|string|max:255',
        ]);

        $request->user()->tasks()->create($validated);

        return redirect('tasks');
    }
}
