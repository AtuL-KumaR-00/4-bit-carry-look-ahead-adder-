# Carry-look-ahead-adder
Motivation behind Carry Look-Ahead Adder : 
In ripple carry adders, for each adder block, the two bits that are to be added are available instantly. However, each adder block waits for the carry to arrive from its previous block. So, it is not possible to generate the sum and carry of any block until the input carry is known. The i^{th}  block waits for the i-1^{th}  block to produce its carry. So there will be a considerable time delay which is carry propagation delay. 

A carry look-ahead adder reduces the propagation delay by introducing more complex hardware. In this design, the ripple carry design is suitably transformed such that the carry logic over fixed groups of bits of the adder is reduced to two-level logic. Let us discuss the design in detail. 
![image](https://user-images.githubusercontent.com/64649440/172459674-3363c479-6d8a-4496-ae4b-a40633eb99b7.png)


Consider the full adder circuit shown above with corresponding truth table. We define two variables as ‘carry generate’ G_{i}  and ‘carry propagate’ P_{i}  then, 
![image](https://user-images.githubusercontent.com/64649440/172460287-cc189241-da0a-4b43-b350-155f57ac8d87.png)
  
 

The sum output and carry output can be expressed in terms of carry generate G_{i}  and carry propagate P_{i}  as
![image](https://user-images.githubusercontent.com/64649440/172460336-f04d9781-6298-411f-94f3-6a43ee4cbdc1.png)

where ![image](https://user-images.githubusercontent.com/64649440/172460403-5aab127e-bcb2-4f2a-a181-25f9989e72aa.png)  produces the carry when both A_i  , B_i  are 1 regardless of the input carry. P_i  is associated with the propagation of carry from C_i  to C_i+1  . 
 

The carry output Boolean function of each stage in a 4 stage carry look-ahead adder can be expressed as

![image](https://user-images.githubusercontent.com/64649440/172460473-2928acd4-7f9d-4abe-8c38-681ba188e353.png)  
 

From the above Boolean equations we can observe that C_4  does not have to wait for C_3  and C_2  to propagate but actually C_4  is propagated at the same time as C_3  and C_2  . Since the Boolean expression for each carry output is the sum of products so these can be implemented with one level of AND gates followed by an OR gate.

The implementation of three Boolean functions for each carry output (C_2  , C_3  and C_4  ) for a carry look-ahead carry generator shown in below figure. 

 ![image](https://user-images.githubusercontent.com/64649440/172460680-4802fe32-43c4-4773-b30b-3ff8c91bb43e.png)




Time Complexity Analysis : 
We could think of a carry look-ahead adder as made up of two “parts” 
 

The part that computes the carry for each bit.
The part that adds the input bits and the carry for each bit position.
The log(n)  complexity arises from the part that generates the carry, not the circuit that adds the bits. 
Now, for the generation of the n^{th}  carry bit, we need to perform a AND between (n+1) inputs. The complexity of the adder comes down to how we perform this AND operation. If we have AND gates, each with a fan-in (number of inputs accepted) of k, then we can find the AND of all the bits in log_{k}(n+1)  time. This is represented in asymptotic notation as \Theta(log n)  . 

### Advantages and Disadvantages of Carry Look-Ahead Adder : 
### Advantages – 
 

* The propagation delay is reduced.
* It provides the fastest addition logic.
### Disadvantages – 
 

* The Carry Look-ahead adder circuit gets complicated as the number of variables increase.
* The circuit is costlier as it involves more number of hardware.
