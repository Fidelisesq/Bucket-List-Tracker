/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getBucketListItem = /* GraphQL */ `
  query GetBucketListItem($id: ID!) {
    getBucketListItem(id: $id) {
      id
      name
      description
      completed
      createdAt
      updatedAt
      __typename
    }
  }
`;
export const listBucketListItems = /* GraphQL */ `
  query ListBucketListItems(
    $filter: ModelBucketListItemFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listBucketListItems(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        id
        name
        description
        completed
        createdAt
        updatedAt
        __typename
      }
      nextToken
      __typename
    }
  }
`;
