import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Button, TextField, Container, Typography, Grid, Card, CardContent, IconButton } from '@mui/material';
import { Delete } from '@mui/icons-material';
import { Box } from '@mui/material';
import config from './config'; // Import the config file with environment variable support

// Use the config to define API URLs
const GET_TASK_API_BASE_URL = process.env.REACT_APP_GET_TASK_API;
const DELETE_TASK_API_BASE_URL = process.env.REACT_APP_DELETE_TASK_API;
const CREATE_TASK_API_BASE_URL = process.env.REACT_APP_CREATE_TASK_API;

//Update Task Functionality is Work In Progress
// const UPDATE_TASK_API_BASE_URL = '';

const backgroundImage = process.env.PUBLIC_URL + '/background.jpg';

function TodoApp() {
    const [task, settask] = useState([]);
    const [newTask, setNewTask] = useState({ title: '', description: '' });

    const fetchtask = async () => {
        try {
            const response = await axios.get(`${GET__API_BASE_URL}/`);
            settask(response.data);
        } catch (error) {
            console.error('Error fetching task', error);
        }
    };

    const createTask = async () => {
        try {
            await axios.post(`${CREATE_TASK_API_BASE_URL}/task`, newTask);
            fetchtask();
            setNewTask({ title: '', description: '' });
        } catch (error) {
            console.error('Error creating task', error);
        }
    };

    const deleteTask = async (taskId) => {
        try {
            await axios.delete(`${DELETE_TASK_API_BASE_URL}/task/${taskId}`);
            fetchtask();
        } catch (error) {
            console.error('Error deleting task', error);
        }
    };

    useEffect(() => {
        fetchtask();
    }, []);

    return (
        <Box
            style={{
                backgroundImage: `url(${backgroundImage})`, // Use the imported variable
                backgroundSize: 'cover',
                backgroundRepeat: 'no-repeat',
                backgroundAttachment: 'fixed', // Optional, for a fixed background
                minHeight: '100vh',
            }}
        >
            <Container maxWidth="sm">
                <Typography
                    variant="h3"
                    gutterBottom
                    style={{
                        textAlign: 'center', // Center align text
                        color: 'white', // Set text color to white
                        margin: '8px',
                    }}
                >
                    <img src="/devopsinsiderslogo.png" alt="My Logo" />
                    ToDo App
                </Typography>
                <div>
                    <TextField
                        label="Title"
                        variant="outlined"
                        color="secondary"
                        fullWidth
                        value={newTask.title}
                        margin="normal"
                        onChange={(e) => setNewTask({ ...newTask, title: e.target.value })}
                        InputProps={{
                            style: {
                                color: 'white',       // Set text color to white
                                borderColor: 'white',  // Set border color to white
                                '&:hover': {
                                    borderColor: 'white', // Set border color to white on hover
                                },
                            },
                        }}
                        InputLabelProps={{
                            style: {
                                color: 'white',       // Set label text color to white
                            },
                        }}
                    />

                    <TextField
                        label="Description"
                        variant="outlined"
                        fullWidth
                        multiline
                        rows={4}
                        value={newTask.description}
                        margin="normal"
                        onChange={(e) => setNewTask({ ...newTask, description: e.target.value })}
                        InputProps={{
                            style: {
                                color: 'white',           // Set text color to white
                                borderColor: 'white',      // Set border color to white
                                '&:hover': {
                                    borderColor: 'white',    // Set border color to white on hover
                                },
                            },
                        }}
                        InputLabelProps={{
                            style: {
                                color: 'white',           // Set label text color to white
                            },
                        }}
                    />

                    <Button variant="contained" color="primary" onClick={createTask} style={{ margin: '8px' }}>
                        Add Task
                    </Button>
                </div>

                <div>
                    <Typography
                        variant="h4"
                        gutterBottom
                        style={{
                            textAlign: 'center', // Center align text
                            color: 'white', // Set text color to white
                            margin: '15px',
                        }}
                    >
                        Existing task
                    </Typography>

                    {task.map((task) => (
                        <Box key={task.ID} mb={2}>
                            <Card key={task.ID} variant="elevation">
                                <CardContent>
                                    <Typography variant="h6">{task.Title}</Typography>
                                    <Typography variant="body2">{task.Description}</Typography>
                                    <IconButton onClick={() => deleteTask(task.ID)} color="secondary">
                                        <Delete />
                                    </IconButton>
                                </CardContent>
                            </Card>
                        </Box>
                    ))}
                </div>
            </Container>
        </Box>
    );
}

export default TodoApp;
