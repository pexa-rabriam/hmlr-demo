## Description
This is a repo for a demo HMLR Mock Server.

### Prerequisite
- Docker

### Usage
1. To start the wiremock server using `docker`: 
   ```shell script
   docker run -it --rm -p 8080:8080 -v $PWD/hmlr-mock-server/resources:/home/wiremock wiremock/wiremock:2.35.0 --verbose
   ```

2. To start the wiremock server using `batect`:
   ```shell script
   ./batect run-hmlr-mock-server
   ```

3. To create a docker image for the hmlr-mock-server:
   ```shell script
   ./batect build-hmlr-mock-server-image
   ```

4. To run the hmlr-mock-server image in a docker container:
   ```shell script
   docker run -it --rm -p 8082:8082 hmlr-mock-server:latest
   ```

5. Fetch wiremock mappings using Postman (Note: Use port 8082 if using the hmlr-mock-server container.)
   ```shell script
   GET http://localhost:8080/__admin/mappings
   ```

6. Use Postman to invoke the Search By Property Description service using the request that returns a successful response:
   ```shell script
   POST http://localhost:8080/hmlr-mock/b2b/ECBG_StubService/EnquiryByPropertyDescriptionV2_0WebService
   ```
   - Request
   ```shell script
   <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
    <soapenv:Header>
        <wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
            <wsse:UsernameToken>
                <wsse:Username>{{userName}}</wsse:Username>
                <wsse:Password type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">{{password}}</wsse:Password>
            </wsse:UsernameToken>
        </wsse:Security>
        <i18n:international xmlns:i18n="http://www.w3.org/2005/09/ws-i18n">
            <i18n:locale>en</i18n:locale>
        </i18n:international>
    </soapenv:Header>
    <soapenv:Body>
        <ns2:searchProperties xmlns:ns="http://www.oscre.org/ns/eReg-Final/2011/RequestSearchByPropertyDescriptionV2_0"
                              xmlns:ns2="http://epdv2_0.ws.bg.lr.gov/">
            <arg0>
                <ns:ID>
                    <ns:MessageID>DfltMsgId1365516738852</ns:MessageID>
                </ns:ID>
                <ns:Product>
                    <ns:ExternalReference>
                        <ns:Reference>Ref 1231</ns:Reference>
                    </ns:ExternalReference>
                    <ns:CustomerReference>
                        <ns:Reference>Customer Ref 0001</ns:Reference>
                    </ns:CustomerReference>
                    <ns:SubjectProperty>
                        <ns:Address>
                            <ns:BuildingNumber>99</ns:BuildingNumber>
                            <ns:PostcodeZone>TQ56 4HY</ns:PostcodeZone>
                        </ns:Address>
                    </ns:SubjectProperty>
                </ns:Product>
            </arg0>
        </ns2:searchProperties>
    </soapenv:Body>
   </soapenv:Envelope>
   ```
