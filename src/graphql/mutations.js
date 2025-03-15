/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const createBucketListItem = /* GraphQL */ `
  mutation CreateBucketListItem(
    $input: CreateBucketListItemInput!
    $condition: ModelBucketListItemConditionInput
  ) {
    createBucketListItem(input: $input, condition: $condition) {
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
export const updateBucketListItem = /* GraphQL */ `
  mutation UpdateBucketListItem(
    $input: UpdateBucketListItemInput!
    $condition: ModelBucketListItemConditionInput
  ) {
    updateBucketListItem(input: $input, condition: $condition) {
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
export const deleteBucketListItem = /* GraphQL */ `
  mutation DeleteBucketListItem(
    $input: DeleteBucketListItemInput!
    $condition: ModelBucketListItemConditionInput
  ) {
    deleteBucketListItem(input: $input, condition: $condition) {
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
