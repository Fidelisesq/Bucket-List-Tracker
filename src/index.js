import React from 'react';
import ReactDOM from 'react-dom';
/* import './index.css'; // Import global styles (optional) */
import App from './App'; // Import your main App component
import { Amplify } from 'aws-amplify';
import awsExports from './aws-exports'; // Ensure this is correct
import { withAuthenticator } from '@aws-amplify/ui-react';

// Configure AWS Amplify
Amplify.configure(awsExports);

// Render the App with Authenticator (sign-in/sign-out handling)
const AppWithAuth = withAuthenticator(App);

ReactDOM.render(
  <React.StrictMode>
    <AppWithAuth />
  </React.StrictMode>,
  document.getElementById('root') // Make sure this matches your HTML file
);
