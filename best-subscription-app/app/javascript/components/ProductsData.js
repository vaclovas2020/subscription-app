import React from "react";
import {useIndexResourceState, Card, IndexTable, TextStyle} from '@shopify/polaris';
import { gql, useQuery } from '@apollo/client';
import ProductsList from "./ProductsList";
const PRODUCTS_QUERY = gql`query { products }`;
export default function ProductsData() {
  const { loading, error, data } = useQuery(PRODUCTS_QUERY);
  if (loading) {
    return (
      <div>Loading</div>
    );
  } else if (error) {
    return (
      <div>Something went wrong!</div>
    );
  } else {
      return (<ProductsList products={ JSON.parse(data.products) } />)
  }
}
