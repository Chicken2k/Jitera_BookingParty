/* eslint-disable @typescript-eslint/no-unused-vars */
import React, { useCallback, useMemo, useEffect } from "react";
import { DefaultPageProps } from "@interfaces/page";
import get from "lodash/get";
import Background from "@components/molecules/Background";
import IcLinedelete from "@components/molecules/IcLinedelete";
import CommonButton2 from "@components/molecules/CommonButton2";
import { Page, Box, Text } from "@jitera/jitera-web-ui-library";
import styles from "./styles.module.css";
type DeleteNotePageProps = DefaultPageProps & {
  pageName?: string;
  className?: string;
};
function DeleteNotePage(props: DeleteNotePageProps): JSX.Element {
  return (
    <Page className={styles.page_container}>
      <Background className={styles.background1} />
      <Box className={styles.container18}>
        <Box className={styles.wrapper18}>
          <Box className={styles.header_info6}>
            <Text className={styles.text5} textType="Text">
              Awesome Note
            </Text>
            <Text className={styles.text6} textType="Text">
              Create note
            </Text>
          </Box>
          <Box className={styles.note110}>
            <Box className={styles.wrapper_note110}>
              <Text className={styles.text9} textType="Text">
                Note 1
              </Text>
              <Text className={styles.text10} textType="Text">
                2 days a go
              </Text>
            </Box>
            <IcLinedelete className={styles.ic_linedelete1} />
          </Box>
          <Box className={styles.note214}>
            <Box className={styles.wrapper_note214}>
              <Text className={styles.text13} textType="Text">
                Note 1
              </Text>
              <Text className={styles.text14} textType="Text">
                2 days a go
              </Text>
            </Box>
            <IcLinedelete className={styles.ic_linedelete2} />
          </Box>
          <Box className={styles.note318}>
            <Box className={styles.wrapper_note318}>
              <Text className={styles.text17} textType="Text">
                Note 1
              </Text>
              <Text className={styles.text18} textType="Text">
                2 days a go
              </Text>
            </Box>
            <IcLinedelete className={styles.ic_linedelete3} />
          </Box>
        </Box>
      </Box>
      <Box className={styles.modal_confirm_delete21}>
        <Text className={styles.text20} textType="Text">
          Are you sure to delete this note ?{" "}
        </Text>
        <Box className={styles.button_wrapper21}>
          <CommonButton2 className={styles.common_button1} />
          <CommonButton2 className={styles.common_button2} />
        </Box>
      </Box>
    </Page>
  );
}
export default DeleteNotePage;
