/* tslint:disable */
/* eslint-disable */

/**
 *
 * @export
 * @interface CreateContactParams
 */
export interface CreateContactParams {
    /**
     *
     * @type {CreateContactParamsResource}
     * @memberof CreateContactParams
     */
    contacts: CreateContactParamsResource;
}
/**
 *
 * @export
 * @interface CreateContactParamsResource
 */
export interface CreateContactParamsResource {
    /**
     *
     * @type {string}
     * @memberof CreateContactParamsResource
     */
    name: string;
    /**
     *
     * @type {string}
     * @memberof CreateContactParamsResource
     */
    email: string;
    /**
     *
     * @type {string}
     * @memberof CreateContactParamsResource
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof CreateContactParamsResource
     */
    content: string;
}
/**
 *
 * @export
 * @interface CreateProductParams
 */
export interface CreateProductParams {
    /**
     *
     * @type {CreateProductParamsResource}
     * @memberof CreateProductParams
     */
    product: CreateProductParamsResource;
}
/**
 *
 * @export
 * @interface CreateProductParamsResource
 */
export interface CreateProductParamsResource {
    /**
     *
     * @type {string}
     * @memberof CreateProductParamsResource
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof CreateProductParamsResource
     */
    image_url: string;
    /**
     *
     * @type {string}
     * @memberof CreateProductParamsResource
     */
    brand_amazon_name: string;
    /**
     *
     * @type {string}
     * @memberof CreateProductParamsResource
     */
    url: string;
    /**
     *
     * @type {string}
     * @memberof CreateProductParamsResource
     */
    asin: string;
    /**
     *
     * @type {number}
     * @memberof CreateProductParamsResource
     */
    price: number;
}
/**
 *
 * @export
 * @interface CreateSessionParams
 */
export interface CreateSessionParams {
    /**
     *
     * @type {CreateSessionParamsResource}
     * @memberof CreateSessionParams
     */
    session: CreateSessionParamsResource;
}
/**
 *
 * @export
 * @interface CreateSessionParamsResource
 */
export interface CreateSessionParamsResource {
    /**
     *
     * @type {string}
     * @memberof CreateSessionParamsResource
     */
    email: string;
    /**
     *
     * @type {string}
     * @memberof CreateSessionParamsResource
     */
    password: string;
}
/**
 *
 * @export
 * @interface CreateUserParams
 */
export interface CreateUserParams {
    /**
     *
     * @type {CreateUserParamsResource}
     * @memberof CreateUserParams
     */
    user: CreateUserParamsResource;
}
/**
 *
 * @export
 * @interface CreateUserParamsResource
 */
export interface CreateUserParamsResource {
    /**
     *
     * @type {string}
     * @memberof CreateUserParamsResource
     */
    name: string;
    /**
     *
     * @type {string}
     * @memberof CreateUserParamsResource
     */
    email: string;
    /**
     *
     * @type {string}
     * @memberof CreateUserParamsResource
     */
    password: string;
    /**
     *
     * @type {string}
     * @memberof CreateUserParamsResource
     */
    password_confirmation: string;
}
/**
 *
 * @export
 * @interface ErrorResponse
 */
export interface ErrorResponse {
    /**
     *
     * @type {string}
     * @memberof ErrorResponse
     */
    errors: string;
}
/**
 *
 * @export
 * @interface GetCurrentUserResponse
 */
export interface GetCurrentUserResponse {
    /**
     *
     * @type {GetCurrentUserResponseResource}
     * @memberof GetCurrentUserResponse
     */
    user: GetCurrentUserResponseResource | null;
}
/**
 *
 * @export
 * @interface GetCurrentUserResponseResource
 */
export interface GetCurrentUserResponseResource {
    /**
     *
     * @type {number}
     * @memberof GetCurrentUserResponseResource
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetCurrentUserResponseResource
     */
    name: string;
}
/**
 *
 * @export
 * @interface GetPostResponse
 */
export interface GetPostResponse {
    /**
     *
     * @type {GetPostResponseResource}
     * @memberof GetPostResponse
     */
    post: GetPostResponseResource;
}
/**
 *
 * @export
 * @interface GetPostResponseResource
 */
export interface GetPostResponseResource {
    /**
     *
     * @type {number}
     * @memberof GetPostResponseResource
     */
    product_id: number;
    /**
     *
     * @type {string}
     * @memberof GetPostResponseResource
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof GetPostResponseResource
     */
    content: string;
    /**
     *
     * @type {number}
     * @memberof GetPostResponseResource
     */
    rate: number;
    /**
     *
     * @type {any}
     * @memberof GetPostResponseResource
     */
    picture?: any;
    /**
     *
     * @type {string}
     * @memberof GetPostResponseResource
     */
    picture_url?: string;
}
/**
 *
 * @export
 * @interface GetPostsResponse
 */
export interface GetPostsResponse {
    /**
     *
     * @type {number}
     * @memberof GetPostsResponse
     */
    total_pages: number;
    /**
     *
     * @type {Array<GetPostsResponseResourceEach>}
     * @memberof GetPostsResponse
     */
    posts: Array<GetPostsResponseResourceEach>;
}
/**
 *
 * @export
 * @interface GetPostsResponseResourceEach
 */
export interface GetPostsResponseResourceEach {
    /**
     *
     * @type {number}
     * @memberof GetPostsResponseResourceEach
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEach
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEach
     */
    content: string;
    /**
     *
     * @type {number}
     * @memberof GetPostsResponseResourceEach
     */
    rate: number;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEach
     */
    picture_url?: string | null;
    /**
     *
     * @type {boolean}
     * @memberof GetPostsResponseResourceEach
     */
    is_owner: boolean;
    /**
     *
     * @type {GetPostsResponseResourceEachUser}
     * @memberof GetPostsResponseResourceEach
     */
    user: GetPostsResponseResourceEachUser;
    /**
     *
     * @type {GetPostsResponseResourceEachProduct}
     * @memberof GetPostsResponseResourceEach
     */
    product: GetPostsResponseResourceEachProduct;
}
/**
 *
 * @export
 * @interface GetPostsResponseResourceEachProduct
 */
export interface GetPostsResponseResourceEachProduct {
    /**
     *
     * @type {number}
     * @memberof GetPostsResponseResourceEachProduct
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachProduct
     */
    image_url: string;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachProduct
     */
    title: string;
}
/**
 *
 * @export
 * @interface GetPostsResponseResourceEachUser
 */
export interface GetPostsResponseResourceEachUser {
    /**
     *
     * @type {number}
     * @memberof GetPostsResponseResourceEachUser
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachUser
     */
    picture_url: string;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachUser
     */
    name: string;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachUser
     */
    gender: string | null;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachUser
     */
    height: string | null;
    /**
     *
     * @type {string}
     * @memberof GetPostsResponseResourceEachUser
     */
    weight: string | null;
}
/**
 *
 * @export
 * @interface GetProductResponse
 */
export interface GetProductResponse {
    /**
     *
     * @type {GetProductResponseResource}
     * @memberof GetProductResponse
     */
    product: GetProductResponseResource;
}
/**
 *
 * @export
 * @interface GetProductResponseResource
 */
export interface GetProductResponseResource {
    /**
     *
     * @type {number}
     * @memberof GetProductResponseResource
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetProductResponseResource
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof GetProductResponseResource
     */
    image_url: string;
    /**
     *
     * @type {string}
     * @memberof GetProductResponseResource
     */
    url: string;
    /**
     *
     * @type {string}
     * @memberof GetProductResponseResource
     */
    brand_amazon_name: string;
    /**
     *
     * @type {string}
     * @memberof GetProductResponseResource
     */
    price: string;
    /**
     *
     * @type {boolean}
     * @memberof GetProductResponseResource
     */
    is_liked: boolean | null;
}
/**
 *
 * @export
 * @interface GetProductsResponse
 */
export interface GetProductsResponse {
    /**
     *
     * @type {number}
     * @memberof GetProductsResponse
     */
    total_pages: number;
    /**
     *
     * @type {Array<GetProductsResponseResourceEach>}
     * @memberof GetProductsResponse
     */
    products: Array<GetProductsResponseResourceEach>;
}
/**
 *
 * @export
 * @interface GetProductsResponseResourceEach
 */
export interface GetProductsResponseResourceEach {
    /**
     *
     * @type {number}
     * @memberof GetProductsResponseResourceEach
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetProductsResponseResourceEach
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof GetProductsResponseResourceEach
     */
    image_url: string;
    /**
     *
     * @type {string}
     * @memberof GetProductsResponseResourceEach
     */
    brand_amazon_name: string;
    /**
     *
     * @type {string}
     * @memberof GetProductsResponseResourceEach
     */
    product_link: string;
    /**
     *
     * @type {number}
     * @memberof GetProductsResponseResourceEach
     */
    post_count: number;
    /**
     *
     * @type {number}
     * @memberof GetProductsResponseResourceEach
     */
    rate: number;
    /**
     *
     * @type {number}
     * @memberof GetProductsResponseResourceEach
     */
    likes: number;
}
/**
 *
 * @export
 * @interface GetUserResponse
 */
export interface GetUserResponse {
    /**
     *
     * @type {GetUserResponseResource}
     * @memberof GetUserResponse
     */
    user: GetUserResponseResource;
}
/**
 *
 * @export
 * @interface GetUserResponseResource
 */
export interface GetUserResponseResource {
    /**
     *
     * @type {number}
     * @memberof GetUserResponseResource
     */
    id: number;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    picture_url: string;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    name: string;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    gender: string | null;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    height: string | null;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    weight: string | null;
    /**
     *
     * @type {string}
     * @memberof GetUserResponseResource
     */
    comment: string | null;
}
/**
 *
 * @export
 * @interface SearchProductsResponse
 */
export interface SearchProductsResponse {
    /**
     *
     * @type {Array<SearchProductsResponseResourceEach>}
     * @memberof SearchProductsResponse
     */
    products: Array<SearchProductsResponseResourceEach>;
}
/**
 *
 * @export
 * @interface SearchProductsResponseResourceEach
 */
export interface SearchProductsResponseResourceEach {
    /**
     *
     * @type {number}
     * @memberof SearchProductsResponseResourceEach
     */
    id: number | null;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    title: string;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    image_url: string;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    brand_amazon_name: string;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    product_link: string | null;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    url: string;
    /**
     *
     * @type {string}
     * @memberof SearchProductsResponseResourceEach
     */
    asin: string;
    /**
     *
     * @type {number}
     * @memberof SearchProductsResponseResourceEach
     */
    price: number;
}
