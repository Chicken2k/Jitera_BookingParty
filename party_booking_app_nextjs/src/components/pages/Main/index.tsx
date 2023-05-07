/* eslint-disable @typescript-eslint/no-unused-vars */
import React, { useCallback, useMemo, useEffect } from "react";
import { DefaultPageProps } from "@interfaces/page";
import get from "lodash/get";
import Background from "@components/molecules/Background";
import Iconssafarichevronbackward from "@components/molecules/Iconssafarichevronbackward";
import { Page, Box, Text } from "@jitera/jitera-web-ui-library";
import styles from "./styles.module.css";
type MainPageProps = DefaultPageProps & {
  pageName?: string;
  className?: string;
};
function MainPage(props: MainPageProps): JSX.Element {
  return (
    <Page className={styles.page_container}>
      <Box className={styles.container11}>
        <Background className={styles.background1} />
        <Box className={styles.wrapper11}>
          <Box className={styles.info_header5}>
            <Iconssafarichevronbackward
              className={styles.iconssafarichevronbackward1}
            />
            <Text className={styles.text5} textType="Text">
              Back
            </Text>
          </Box>
          <Box className={styles.header_wrapper8}>
            <Text className={styles.text7} textType="Text">
              Note title
            </Text>
            <Text className={styles.text8} textType="Text">
              Recommend
            </Text>
          </Box>
          <Box className={styles.note_item11}>
            <Box className={styles.wrapper_note111}>
              <Text className={styles.text11} textType="Text">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                enim ad minim veniam, quis nostrud exercitation ullamco laboris
                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                enim ad minim veniam, quis nostrud exercitation ullamco laboris
                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
              </Text>
            </Box>
          </Box>
        </Box>
      </Box>
    </Page>
  );
}
export default MainPage;
