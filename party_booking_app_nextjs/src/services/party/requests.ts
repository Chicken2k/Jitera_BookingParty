import { QueryFunctionContext } from "react-query";
import { serviceFetch } from "@utils/service";
import { getRoute } from "@utils/route";

export const DefaultGetApiPartiesQueryKey: [string, string, string] = [
  "Party",
  "GET",
  "/api/parties",
];
export type FetchGetApiPartiesRequestBody = {
  pagination_page: number;
  pagination_limit: number;
  parties: {
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: string;
    admin_id?: string;
    describe?: string;
  };
};
export type FetchGetApiPartiesResponseBody = {
  total_pages: number;
  parties: {
    id?: number;
    created_at?: Date;
    updated_at?: Date;
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: boolean;
    partybookings?: {
      id?: number;
      created_at?: Date;
      updated_at?: Date;
      user_id?: string;
      party_id?: string;
    }[];
    admin?: { id?: number; created_at?: Date; updated_at?: Date };
    admin_id?: string;
    describe?: string;
  }[];
};

export const fetchGetApiParties = async (
  context: QueryFunctionContext<
    [string, string, string, Partial<FetchGetApiPartiesRequestBody> | undefined]
  >
): Promise<FetchGetApiPartiesResponseBody> => {
  return serviceFetch({
    url: getRoute("/api/parties", context.queryKey[3]),
    params: context.queryKey[3],
    method: "GET",
  });
};
export const DefaultGetApiPartiesIdQueryKey: [string, string, string] = [
  "Party",
  "GET",
  "/api/parties/:id",
];
export type FetchGetApiPartiesIdRequestBody = {
  id: string;
  parties: { partylocation?: string };
};
export type FetchGetApiPartiesIdResponseBody = {
  party: {
    id?: number;
    created_at?: Date;
    updated_at?: Date;
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: boolean;
    partybookings?: {
      id?: number;
      created_at?: Date;
      updated_at?: Date;
      user_id?: string;
      party_id?: string;
    }[];
    admin?: { id?: number; created_at?: Date; updated_at?: Date };
    admin_id?: string;
    describe?: string;
  };
};

export const fetchGetApiPartiesId = async (
  context: QueryFunctionContext<
    [
      string,
      string,
      string,
      Partial<FetchGetApiPartiesIdRequestBody> | undefined
    ]
  >
): Promise<FetchGetApiPartiesIdResponseBody> => {
  return serviceFetch({
    url: getRoute("/api/parties/:id", context.queryKey[3]),
    params: context.queryKey[3],
    method: "GET",
  });
};

export type MutatePostApiPartiesRequestBody = {
  parties: {
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: string;
    admin_id?: string;
    describe?: string;
  };
};
export type MutatePostApiPartiesResponseBody = {
  party: {
    id?: number;
    created_at?: Date;
    updated_at?: Date;
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: boolean;
    partybookings?: {
      id?: number;
      created_at?: Date;
      updated_at?: Date;
      user_id?: string;
      party_id?: string;
    }[];
    admin?: { id?: number; created_at?: Date; updated_at?: Date };
    admin_id?: string;
    describe?: string;
  };
};

export const mutatePostApiParties = async (
  body: MutatePostApiPartiesRequestBody
): Promise<MutatePostApiPartiesResponseBody> => {
  return serviceFetch({
    url: getRoute("/api/parties", body),
    method: "POST",
    data: body,
  });
};
export type MutatePutApiPartiesIdRequestBody = {
  id: string;
  parties: {
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: string;
    admin_id?: string;
    describe?: string;
  };
};
export type MutatePutApiPartiesIdResponseBody = {
  party: {
    id?: number;
    created_at?: Date;
    updated_at?: Date;
    nameparty?: string;
    partystarttime?: Date;
    partylocation?: string;
    numberofpeople?: number;
    isstatus?: boolean;
    partybookings?: {
      id?: number;
      created_at?: Date;
      updated_at?: Date;
      user_id?: string;
      party_id?: string;
    }[];
    admin?: { id?: number; created_at?: Date; updated_at?: Date };
    admin_id?: string;
    describe?: string;
  };
};

export const mutatePutApiPartiesId = async (
  body: MutatePutApiPartiesIdRequestBody
): Promise<MutatePutApiPartiesIdResponseBody> => {
  return serviceFetch({
    url: getRoute("/api/parties/:id", body),
    method: "PUT",
    data: body,
  });
};
export type MutateDeleteApiPartiesIdRequestBody = {
  id: string;
  parties: { partylocation?: string };
};
export type MutateDeleteApiPartiesIdResponseBody = {};

export const mutateDeleteApiPartiesId = async (
  body: MutateDeleteApiPartiesIdRequestBody
): Promise<MutateDeleteApiPartiesIdResponseBody> => {
  return serviceFetch({
    url: getRoute("/api/parties/:id", body),
    method: "DELETE",
    data: body,
  });
};
