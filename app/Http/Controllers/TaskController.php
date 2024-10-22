<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;
use Inertia\Response;

class TaskController extends Controller
{

    public function show(User $user): Response  {
        return Inertia::render('Tasks', [
            'tasks' => []
        ]);
    }
}
