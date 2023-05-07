/* eslint-disable @typescript-eslint/no-unused-vars */
import React, { useCallback, useMemo, useEffect } from "react";
import { DefaultPageProps } from "@interfaces/page";
import get from "lodash/get";
import { Box, Text } from "@jitera/jitera-web-ui-library";
import styles from "./styles.module.css";
type TextFieldTitleMoleculeProps = DefaultPageProps & {
  pageName?: string;
  className?: string;
  responsiveVisibility?: string[];
};
function TextFieldTitleMolecule(
  props: TextFieldTitleMoleculeProps
): JSX.Element {
  return (
    <Box
      className={`${styles.page_container} ${get(props, "className")}`}
      responsiveVisibility={get(props, "responsiveVisibility")}
    >
      <Text className={styles.text5}>FORM NAME</Text>
      <Box className={styles.tagmust8}>
        <Text className={styles.text8}>必須</Text>
      </Box>
    </Box>
  );
}
export default TextFieldTitleMolecule;
