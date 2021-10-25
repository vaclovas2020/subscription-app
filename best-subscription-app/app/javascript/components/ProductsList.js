import React from 'react';
import { useIndexResourceState, Card, IndexTable, TextStyle } from '@shopify/polaris';
export default function ProductsList(props) {
  const products = props.products;
  const resourceName = {
    singular: 'product',
    plural: 'products',
  };

  const { selectedResources, allResourcesSelected, handleSelectionChange } =
    useIndexResourceState(products);

  return (
    <Card>
      <IndexTable
        resourceName={resourceName}
        itemCount={products.length}
        selectedItemsCount={
          allResourcesSelected ? 'All' : selectedResources.length
        }
        onSelectionChange={handleSelectionChange}
        headings={[
          { title: 'Product title' },
        ]}
      >
        {products.map(
          ({ id, title }, index) => (
            <IndexTable.Row
              id={id}
              key={id}
              selected={selectedResources.includes(id)}
              position={index}
            >
              <IndexTable.Cell><TextStyle variation="strong">{title}</TextStyle></IndexTable.Cell>
            </IndexTable.Row>
          ),
        )}
      </IndexTable>
    </Card>
  );
}
