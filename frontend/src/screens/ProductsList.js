import React, {useEffect, useState} from 'react';
import { View, Text, FlatList, StyleSheet } from 'react-native';

import { Product } from '../components/Product.js';
import { getProducts } from '../services/ProductsService.js';
import axios from "axios";
import { apiUrl } from '../../helper.js';

export function ProductsList ({navigation, route}) {

  function renderProduct({item: product}) {
    return (
      <Product {...product} 
      onPress={() => {
        // console.log(product);
        navigation.navigate('ProductDetails', {
          productId: product.product_id,
        });
      }}
      />
    );
  }
  
  const [products, setProducts] = useState([]);
  
  useEffect(() => {
    const {shopID } = route.params;
    axios.get(`${apiUrl}/products/${shopID}`)
    .then( res => {
      // console.log(res.data);
      setProducts(res.data.products);
    })
    .catch( e => {
      console.log(e);
    })
    
  });
  
  return (
    <FlatList
      style={styles.productsList}
      contentContainerStyle={styles.productsListContainer}
      keyExtractor={(item) => item.product_id.toString()}
      data={products}
      renderItem={renderProduct}
    />
  );
}

const styles = StyleSheet.create({
  productsList: {
    backgroundColor: '#eeeeee',
  },
  productsListContainer: {
    backgroundColor: '#eeeeee',
    paddingVertical: 8,
    marginHorizontal: 8,
  },
});
