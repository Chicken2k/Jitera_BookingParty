/* eslint-disable @typescript-eslint/no-unused-vars */
import React, { useCallback, useMemo, useEffect } from "react";
import { DefaultPageProps } from "@interfaces/page";
import get from "lodash/get";
import Background from "@components/molecules/Background";
import Iconssafarichevronbackward from "@components/molecules/Iconssafarichevronbackward";
import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import CommonButton2 from "@components/molecules/CommonButton2";
import { useNavigateService } from "@services/navigate";
import { usePartyService } from "@services/party";
import { useAuthenticationService } from "@services/authentication";
import {
  Page,
  Box,
  Text,
  Row,
  Col,
  Input,
  Toast,
} from "@jitera/jitera-web-ui-library";
import styles from "./styles.module.css";
type CreateNotePageProps = DefaultPageProps & {
  pageName?: string;
  className?: string;
};
// eslint-disable-next-line @typescript-eslint/no-empty-interface
interface Form1FormData {
  Party_input: string;
}
function CreateNotePage(props: CreateNotePageProps): JSX.Element {
  const navigateService = useNavigateService();
  const partyService = usePartyService();
  const authenticationService = useAuthenticationService();
  const authenticatedDataValue =
    authenticationService.useAuthenticatedData("authenticatedData");
  const validationForm1Schema = useMemo(
    () =>
      yup.object().shape({
        Party_input: yup.string().required("Party_input is a required field"),
      }),
    []
  );
  const formForm1 = useForm<Form1FormData>({
    // eslint-disable-next-line @typescript-eslint/ban-ts-comment
    // @ts-ignore
    resolver: yupResolver(validationForm1Schema),
    shouldFocusError: true,
    mode: "onChange",
    reValidateMode: "onChange",
  });
  const { errors: formForm1Errors } = formForm1.formState;

  useEffect(() => {
    formForm1.reset({});
  }, []);

  const handleInfoHeader5 = async () => {
    try {
      navigateService.goBack();
    } catch (e: unknown) {}
  };
  const handleOnPressCommonButton1 = async (values?: Form1FormData) => {
    try {
      const responsePostApiParties = await partyService.postApiParties.fetch({
        parties: {
          admin_id: get(authenticatedDataValue, "id"),
          nameparty: get(values, "Party_input", ""),
        },
      });
      navigateService.goBack();
    } catch (e: unknown) {
      Toast.error("Create party failed" || "");
    }
  };
  return (
    <Page className={styles.page_container}>
      <Background className={styles.background1} />
      <Box className={styles.container8}>
        <Box className={styles.wrapper8}>
          <Box className={styles.info_header5} onClick={handleInfoHeader5}>
            <Iconssafarichevronbackward
              className={styles.iconssafarichevronbackward1}
            />
            <Text className={styles.text5} textType="Text">
              Back
            </Text>
          </Box>
          <Box className={styles.card8}>
            <Text className={styles.text7} textType="Text">
              Create party
            </Text>
            <Row
              align="top"
              gutter={[30, 30]}
              justify="start"
              className={styles.row_1}
            >
              <Col md={Number(24)} xl={Number(24)} xs={Number(24)}>
                <Box className={styles.form_1}>
                  <Text className={styles.form_1_name} textType="Text">
                    Form Name
                  </Text>
                  <Box className={styles.input_2_container}>
                    <Box className={styles.input_2_inner}>
                      <Text className={styles.input_2_label} textType="Text">
                        Party
                      </Text>
                      <Text className={styles.input_2_required} textType="Text">
                        *
                      </Text>
                    </Box>
                    <Controller
                      control={formForm1.control}
                      render={({
                        field: { onChange, onBlur, value },
                        fieldState: { isTouched, error },
                      }: any) => {
                        return (
                          <Input
                            inputStyle={styles.party_input_input}
                            placeholder={"Plase input party"}
                            className={styles.party_input}
                            onChange={onChange}
                            value={value}
                          />
                        );
                      }}
                      name="Party_input"
                    />
                    <Box className={styles.input_2_error_message_container}>
                      <Text
                        className={styles.input_2_error_message_text}
                        textType="Text"
                      >
                        {get(formForm1Errors, "Party_input.message")}
                      </Text>
                    </Box>
                    <CommonButton2
                      className={styles.common_button1}
                      label="Create party"
                      onPress={formForm1.handleSubmit(
                        handleOnPressCommonButton1
                      )}
                    />
                  </Box>
                </Box>
              </Col>
            </Row>
          </Box>
        </Box>
      </Box>
    </Page>
  );
}
export default CreateNotePage;
