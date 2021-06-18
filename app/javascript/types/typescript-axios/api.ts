/* tslint:disable */
/* eslint-disable */
/**
 * SuppleBox API Document
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


import { Configuration } from './configuration';
import globalAxios, { AxiosPromise, AxiosInstance } from 'axios';
// Some imports not used depending on template conditions
// @ts-ignore
import { DUMMY_BASE_URL, assertParamExists, setApiKeyToObject, setBasicAuthToObject, setBearerAuthToObject, setOAuthToObject, setSearchParams, serializeDataIfNeeded, toPathString, createRequestFunction } from './common';
// @ts-ignore
import { BASE_PATH, COLLECTION_FORMATS, RequestArgs, BaseAPI, RequiredError } from './base';

/**
 * 
 * @export
 * @interface Contact
 */
export interface Contact {
    /**
     * 
     * @type {ContactContacts}
     * @memberof Contact
     */
    contacts: ContactContacts;
}
/**
 * 
 * @export
 * @interface ContactContacts
 */
export interface ContactContacts {
    /**
     * 
     * @type {string}
     * @memberof ContactContacts
     */
    name: string;
    /**
     * 
     * @type {string}
     * @memberof ContactContacts
     */
    email: string;
    /**
     * 
     * @type {string}
     * @memberof ContactContacts
     */
    title: string;
    /**
     * 
     * @type {string}
     * @memberof ContactContacts
     */
    content: string;
}
/**
 * 
 * @export
 * @interface CurrentUser
 */
export interface CurrentUser {
    /**
     * 
     * @type {CurrentUserUser}
     * @memberof CurrentUser
     */
    user: CurrentUserUser | null;
}
/**
 * 
 * @export
 * @interface CurrentUserUser
 */
export interface CurrentUserUser {
    /**
     * 
     * @type {number}
     * @memberof CurrentUserUser
     */
    id: number;
    /**
     * 
     * @type {string}
     * @memberof CurrentUserUser
     */
    name: string;
    /**
     * 
     * @type {string}
     * @memberof CurrentUserUser
     */
    path: string;
}
/**
 * 
 * @export
 * @interface InlineResponse200
 */
export interface InlineResponse200 {
    /**
     * 
     * @type {Array<Products>}
     * @memberof InlineResponse200
     */
    products: Array<Products>;
}
/**
 * 
 * @export
 * @interface InlineResponse2001
 */
export interface InlineResponse2001 {
    /**
     * 
     * @type {Array<Posts>}
     * @memberof InlineResponse2001
     */
    posts: Array<Posts>;
}
/**
 * 
 * @export
 * @interface Posts
 */
export interface Posts {
    /**
     * 
     * @type {string}
     * @memberof Posts
     */
    title: string;
    /**
     * 
     * @type {string}
     * @memberof Posts
     */
    content: string;
    /**
     * 
     * @type {number}
     * @memberof Posts
     */
    rate: number;
    /**
     * 
     * @type {string}
     * @memberof Posts
     */
    picture_url?: string | null;
    /**
     * 
     * @type {string}
     * @memberof Posts
     */
    edit_path: string;
    /**
     * 
     * @type {PostsUser}
     * @memberof Posts
     */
    user: PostsUser;
    /**
     * 
     * @type {PostsProduct}
     * @memberof Posts
     */
    product: PostsProduct;
}
/**
 * 
 * @export
 * @interface PostsProduct
 */
export interface PostsProduct {
    /**
     * 
     * @type {string}
     * @memberof PostsProduct
     */
    image_url: string;
    /**
     * 
     * @type {string}
     * @memberof PostsProduct
     */
    path: string;
    /**
     * 
     * @type {string}
     * @memberof PostsProduct
     */
    title: string;
}
/**
 * 
 * @export
 * @interface PostsUser
 */
export interface PostsUser {
    /**
     * 
     * @type {string}
     * @memberof PostsUser
     */
    picture_url: string;
    /**
     * 
     * @type {string}
     * @memberof PostsUser
     */
    name: string;
    /**
     * 
     * @type {string}
     * @memberof PostsUser
     */
    gender?: string | null;
    /**
     * 
     * @type {string}
     * @memberof PostsUser
     */
    height?: string | null;
    /**
     * 
     * @type {string}
     * @memberof PostsUser
     */
    weight?: string | null;
}
/**
 * 
 * @export
 * @interface Products
 */
export interface Products {
    /**
     * 
     * @type {string}
     * @memberof Products
     */
    title: string;
    /**
     * 
     * @type {string}
     * @memberof Products
     */
    image_url: string;
    /**
     * 
     * @type {string}
     * @memberof Products
     */
    brand_amazon_name?: string;
    /**
     * 
     * @type {string}
     * @memberof Products
     */
    product_link: string;
    /**
     * 
     * @type {number}
     * @memberof Products
     */
    post_count: number;
    /**
     * 
     * @type {number}
     * @memberof Products
     */
    rate: number;
    /**
     * 
     * @type {number}
     * @memberof Products
     */
    likes: number;
}

/**
 * DefaultApi - axios parameter creator
 * @export
 */
export const DefaultApiAxiosParamCreator = function (configuration?: Configuration) {
    return {
        /**
         * 
         * @summary Get Current User
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchCurrentUser: async (options: any = {}): Promise<RequestArgs> => {
            const localVarPath = `/api/sessions`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            setSearchParams(localVarUrlObj, localVarQueryParameter, options.query);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @summary Get Products
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchPosts: async (limit?: number, options: any = {}): Promise<RequestArgs> => {
            const localVarPath = `/api/posts`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            if (limit !== undefined) {
                localVarQueryParameter['limit'] = limit;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter, options.query);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @summary Get and Search Products
         * @param {number} [page] 
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchProducts: async (page?: number, limit?: number, options: any = {}): Promise<RequestArgs> => {
            const localVarPath = `/api/products`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'GET', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;

            if (page !== undefined) {
                localVarQueryParameter['page'] = page;
            }

            if (limit !== undefined) {
                localVarQueryParameter['limit'] = limit;
            }


    
            setSearchParams(localVarUrlObj, localVarQueryParameter, options.query);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
        /**
         * 
         * @summary Post Contact
         * @param {Contact} [contact] 問い合わせに必要なパラメータ
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        postContact: async (contact?: Contact, options: any = {}): Promise<RequestArgs> => {
            const localVarPath = `/api/contacts`;
            // use dummy base URL string because the URL constructor only accepts absolute URLs.
            const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
            let baseOptions;
            if (configuration) {
                baseOptions = configuration.baseOptions;
            }

            const localVarRequestOptions = { method: 'POST', ...baseOptions, ...options};
            const localVarHeaderParameter = {} as any;
            const localVarQueryParameter = {} as any;


    
            localVarHeaderParameter['Content-Type'] = 'application/json';

            setSearchParams(localVarUrlObj, localVarQueryParameter, options.query);
            let headersFromBaseOptions = baseOptions && baseOptions.headers ? baseOptions.headers : {};
            localVarRequestOptions.headers = {...localVarHeaderParameter, ...headersFromBaseOptions, ...options.headers};
            localVarRequestOptions.data = serializeDataIfNeeded(contact, localVarRequestOptions, configuration)

            return {
                url: toPathString(localVarUrlObj),
                options: localVarRequestOptions,
            };
        },
    }
};

/**
 * DefaultApi - functional programming interface
 * @export
 */
export const DefaultApiFp = function(configuration?: Configuration) {
    const localVarAxiosParamCreator = DefaultApiAxiosParamCreator(configuration)
    return {
        /**
         * 
         * @summary Get Current User
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async fetchCurrentUser(options?: any): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<CurrentUser>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.fetchCurrentUser(options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @summary Get Products
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async fetchPosts(limit?: number, options?: any): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse2001>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.fetchPosts(limit, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @summary Get and Search Products
         * @param {number} [page] 
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async fetchProducts(page?: number, limit?: number, options?: any): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<InlineResponse200>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.fetchProducts(page, limit, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
        /**
         * 
         * @summary Post Contact
         * @param {Contact} [contact] 問い合わせに必要なパラメータ
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        async postContact(contact?: Contact, options?: any): Promise<(axios?: AxiosInstance, basePath?: string) => AxiosPromise<object>> {
            const localVarAxiosArgs = await localVarAxiosParamCreator.postContact(contact, options);
            return createRequestFunction(localVarAxiosArgs, globalAxios, BASE_PATH, configuration);
        },
    }
};

/**
 * DefaultApi - factory interface
 * @export
 */
export const DefaultApiFactory = function (configuration?: Configuration, basePath?: string, axios?: AxiosInstance) {
    const localVarFp = DefaultApiFp(configuration)
    return {
        /**
         * 
         * @summary Get Current User
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchCurrentUser(options?: any): AxiosPromise<CurrentUser> {
            return localVarFp.fetchCurrentUser(options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @summary Get Products
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchPosts(limit?: number, options?: any): AxiosPromise<InlineResponse2001> {
            return localVarFp.fetchPosts(limit, options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @summary Get and Search Products
         * @param {number} [page] 
         * @param {number} [limit] 
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        fetchProducts(page?: number, limit?: number, options?: any): AxiosPromise<InlineResponse200> {
            return localVarFp.fetchProducts(page, limit, options).then((request) => request(axios, basePath));
        },
        /**
         * 
         * @summary Post Contact
         * @param {Contact} [contact] 問い合わせに必要なパラメータ
         * @param {*} [options] Override http request option.
         * @throws {RequiredError}
         */
        postContact(contact?: Contact, options?: any): AxiosPromise<object> {
            return localVarFp.postContact(contact, options).then((request) => request(axios, basePath));
        },
    };
};

/**
 * DefaultApi - object-oriented interface
 * @export
 * @class DefaultApi
 * @extends {BaseAPI}
 */
export class DefaultApi extends BaseAPI {
    /**
     * 
     * @summary Get Current User
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof DefaultApi
     */
    public fetchCurrentUser(options?: any) {
        return DefaultApiFp(this.configuration).fetchCurrentUser(options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @summary Get Products
     * @param {number} [limit] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof DefaultApi
     */
    public fetchPosts(limit?: number, options?: any) {
        return DefaultApiFp(this.configuration).fetchPosts(limit, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @summary Get and Search Products
     * @param {number} [page] 
     * @param {number} [limit] 
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof DefaultApi
     */
    public fetchProducts(page?: number, limit?: number, options?: any) {
        return DefaultApiFp(this.configuration).fetchProducts(page, limit, options).then((request) => request(this.axios, this.basePath));
    }

    /**
     * 
     * @summary Post Contact
     * @param {Contact} [contact] 問い合わせに必要なパラメータ
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     * @memberof DefaultApi
     */
    public postContact(contact?: Contact, options?: any) {
        return DefaultApiFp(this.configuration).postContact(contact, options).then((request) => request(this.axios, this.basePath));
    }
}


