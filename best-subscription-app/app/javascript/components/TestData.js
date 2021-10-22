import React from "react"
import { gql, useQuery } from '@apollo/client';
const TEST_QUERY = gql`query { testField }`;
export default function TestData(){
  const { loading, error, data } = useQuery(TEST_QUERY);
  if (loading) {
    return (
      <div>Loading</div>
    );
  } else if (error) {
    return (
      <div>Something went wrong!</div>
    );
  } else {
    return (
      <p>{data.testField}</p>
    );
  }
}
