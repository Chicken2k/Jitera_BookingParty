/* eslint-disable @typescript-eslint/no-unused-vars */
import React, { useCallback, useMemo, useEffect } from "react";
import { DefaultPageProps } from "@interfaces/page";
import get from "lodash/get";
import Background from "@components/molecules/Background";
import NoteItem from "@components/molecules/NoteItem";
import { useAuthenticationService } from "@services/authentication";
import { usePartyService } from "@services/party";
import { useNavigateService } from "@services/navigate";
import { Page, Box, Text, List } from "@jitera/jitera-web-ui-library";
import styles from "./styles.module.css";
type HomePageProps = DefaultPageProps & {
  pageName?: string;
  className?: string;
};
function HomePage(props: HomePageProps): JSX.Element {
  const authenticationService = useAuthenticationService();
  const authenticatedDataValue =
    authenticationService.useAuthenticatedData("authenticatedData");
  const partyService = usePartyService();
  const getApiPartiesInstance = partyService.useGetApiParties();
  const getApiPartiesResult = getApiPartiesInstance.useQuery({
    parties: { admin_id: get(authenticatedDataValue, "id") },
  });
  const navigateService = useNavigateService();

  const handleText5 = async () => {
    try {
      navigateService.navigate("/createnote");
    } catch (e: unknown) {}
  };
  return (
    <Page className={styles.page_container}>
      <Background className={styles.background1} />
      <Box className={styles.wrapper11}>
        <Box className={styles.header_wrapper5}>
          <Text className={styles.text4} textType="Text">
            Note list
          </Text>
          <Text className={styles.text5} textType="Text" onClick={handleText5}>
            Create new note
          </Text>
        </Box>
        <List
          dataSource={undefined}
          rowKey={useCallback(
            (item: Record<string, any>) => `${item.id}_${item.created_at}`,
            []
          )}
          renderItem={useCallback(
            (item: any) => (
              <NoteItem content={""} />
            ),
            []
          )}
        />
      </Box>
    </Page>
  );
}
export default HomePage;
