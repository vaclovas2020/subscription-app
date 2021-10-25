import React from "react"
import { gql, useQuery } from '@apollo/client';
import Product from "./Product";
const PRODUCTS_QUERY = gql`query { products }`;
export default function ProductsData(){
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
    return (
      <div>{JSON.parse(data.products).map((product,i) => {
        return ( <Product id={product.id} title={product.title} /> )
      })}</div>
    );
  }
}
