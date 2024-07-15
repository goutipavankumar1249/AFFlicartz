import { useNavigate } from "react-router";
// import logo from '../../assets/logo.png';
// productData 
const productData = [
    {
        id: 7,
        image:'src/assets/images/AJIO_Beauty.png',
        title: 'Hand Painted',
        desc: 'Shop Hand Painted Blue Kaushalam Tea Pot in Aluminium, handmade by Mrinalika Jain. Fair pricing. Ethically made. Positive impact.',
        price: 150,
        trendingProductName: 'Featured',
        quantity: 1,
    },
   
    {
        id: 6,
        image: 'src/assets/images/AJIO_Home.png',
        title: 'Hand Painted Blue Kaushalam Tea Pot in Aluminium',
        desc: 'Shop Hand Painted Blue Kaushalam Tea Pot in Aluminium, handmade by Mrinalika Jain. Fair pricing. Ethically made. Positive impact.',
        price: 130,
        trendingProductName: 'Featured',
        quantity: 1,
    },
    {
        id: 1,
        image: 'src/assets/images/AJIO_Kids.png',
        title: 'Hand Painted Blue Kaushalam Tea Pot in Aluminium',
        desc: 'Shop Hand Painted Blue Kaushalam Tea Pot in Aluminium, handmade by Mrinalika Jain. Fair pricing. Ethically made. Positive impact.',
        price: 120,
        trendingProductName: 'Featured',
        quantity: 1,
    },
    {
        id: 5,
        image: 'src/assets/images/AJIO_Men.png',
        title: 'Hand Painted Blue Kaushalam Tea Pot in Aluminium',
        desc: 'Shop Hand Painted Blue Kaushalam Tea Pot in Aluminium, handmade by Mrinalika Jain. Fair pricing. Ethically made. Positive impact.',
        price: 150,
        trendingProductName: 'Featured',
        quantity: 1,
    },
    {
        id: 4,
        image: 'src/assets/images/AJIO_Women.png',
        title: 'Kaushalam kalash Copper Pot',
        desc: 'Shop Hand Painted Blue Kaushalam Tea Pot in Aluminium, handmade by Mrinalika Jain. Fair pricing. Ethically made. Positive impact.',
        price: 120,
        trendingProductName: 'Featured',
        quantity: 1,
    },
  ]
  

const Meesho= () => {
    const navigate = useNavigate();
    return (
        <div className="mt-10">
            <div className="">
                <h1 className="text-center mb-5 text-2xl ">Get maxiumum cashback on top stores</h1>
            </div>

            <section className="text-gray-600 body-font">
                <div className="container px-5 py-5 mx-auto ">
                    <div className="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 gap-9"> {/* Changed md:grid-cols-3 to md:grid-cols-5 */}
                        {productData.map((item, index) => {
                            const { id, image, title, price } = item
                            return (
                                <div key={id} className="rounded-t-lg flex  rounded-l-lg overflow-hidden justify-center shadow-md cursor-pointer">
                                   <a href="http://www.meesho.com">
                                    <img
                                        className=" object-fill text-center"
                                        src={image}
                                        alt="product"
                                    />
                                   </a>
                                </div>
                            )
                        })}
                    </div>
                </div>
            </section>
        </div>
    );
}

export default Meesho;