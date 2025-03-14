import React, { useState, useEffect } from "react";
import { Amplify } from "aws-amplify";
import { withAuthenticator } from "@aws-amplify/ui-react";
import { API, graphqlOperation } from "aws-amplify";
import awsExports from "./aws-exports";
import { listBucketListItems } from "./graphql/queries";
import { createBucketListItem, deleteBucketListItem } from "./graphql/mutations";
import "@aws-amplify/ui-react/styles.css";

Amplify.configure(awsExports);

function App({ signOut, user }) {
  const [bucketList, setBucketList] = useState([]);
  const [newItem, setNewItem] = useState("");

  useEffect(() => {
    fetchBucketList();
  }, []);

  async function fetchBucketList() {
    try {
      const response = await API.graphql(graphqlOperation(listBucketListItems));
      setBucketList(response.data.listBucketListItems.items);
    } catch (error) {
      console.error("Error fetching bucket list:", error);
    }
  }

  async function addBucketListItem() {
    if (!newItem) return;
    const item = { name: newItem };
    try {
      await API.graphql(graphqlOperation(createBucketListItem, { input: item }));
      setNewItem("");
      fetchBucketList();
    } catch (error) {
      console.error("Error adding item:", error);
    }
  }

  async function removeBucketListItem(id) {
    try {
      await API.graphql(graphqlOperation(deleteBucketListItem, { input: { id } }));
      fetchBucketList();
    } catch (error) {
      console.error("Error deleting item:", error);
    }
  }

  return (
    <div className="app-container">
      <h1>Bucket List Tracker</h1>
      <h2>Welcome, {user.username}!</h2>
      <input
        type="text"
        placeholder="Add a new item"
        value={newItem}
        onChange={(e) => setNewItem(e.target.value)}
      />
      <button onClick={addBucketListItem}>Add</button>
      <ul>
        {bucketList.map((item) => (
          <li key={item.id}>
            {item.name}
            <button onClick={() => removeBucketListItem(item.id)}>Delete</button>
          </li>
        ))}
      </ul>
      <button onClick={signOut}>Sign Out</button>
    </div>
  );
}

export default withAuthenticator(App);
