// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Welcome to the AWS IoT SiteWise API Reference. AWS IoT SiteWise is an AWS
/// service that connects <a
/// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">Industrial
/// Internet of Things (IIoT)</a> devices to the power of the AWS Cloud. For
/// more information, see the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/">AWS IoT
/// SiteWise User Guide</a>. For information about AWS IoT SiteWise quotas, see
/// <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class IoTSiteWise {
  final _s.RestJsonProtocol _protocol;
  IoTSiteWise({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iotsitewise',
            signingName: 'iotsitewise',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Associates a child asset with the given parent asset through a hierarchy
  /// defined in the parent asset's model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/add-associated-assets.html">Associating
  /// assets</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the parent asset.
  ///
  /// Parameter [childAssetId] :
  /// The ID of the child asset to be associated.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of a hierarchy in the parent asset's model. Hierarchies allow
  /// different groupings of assets to be formed that all come from the same
  /// asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> associateAssets({
    required String assetId,
    required String childAssetId,
    required String hierarchyId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(childAssetId, 'childAssetId');
    _s.validateStringLength(
      'childAssetId',
      childAssetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(hierarchyId, 'hierarchyId');
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'childAssetId': childAssetId,
      'hierarchyId': hierarchyId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/associate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a group (batch) of assets with an AWS IoT SiteWise Monitor
  /// project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [assetIds] :
  /// The IDs of the assets to be associated to the project.
  ///
  /// Parameter [projectId] :
  /// The ID of the project to which to associate the assets.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<BatchAssociateProjectAssetsResponse> batchAssociateProjectAssets({
    required List<String> assetIds,
    required String projectId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetIds, 'assetIds');
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetIds': assetIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(projectId)}/assets/associate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateProjectAssetsResponse.fromJson(response);
  }

  /// Disassociates a group (batch) of assets from an AWS IoT SiteWise Monitor
  /// project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetIds] :
  /// The IDs of the assets to be disassociated from the project.
  ///
  /// Parameter [projectId] :
  /// The ID of the project from which to disassociate the assets.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<BatchDisassociateProjectAssetsResponse>
      batchDisassociateProjectAssets({
    required List<String> assetIds,
    required String projectId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetIds, 'assetIds');
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetIds': assetIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/projects/${Uri.encodeComponent(projectId)}/assets/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateProjectAssetsResponse.fromJson(response);
  }

  /// Sends a list of asset property values to AWS IoT SiteWise. Each value is a
  /// timestamp-quality-value (TQV) data point. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/ingest-api.html">Ingesting
  /// data using the API</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul> <important>
  /// With respect to Unix epoch time, AWS IoT SiteWise accepts only TQVs that
  /// have a timestamp of no more than 7 days in the past and no more than 5
  /// minutes in the future. AWS IoT SiteWise rejects timestamps outside of the
  /// inclusive range of [-7 days, +5 minutes] and returns a
  /// <code>TimestampOutOfRangeException</code> error.
  ///
  /// For each asset property, AWS IoT SiteWise overwrites TQVs with duplicate
  /// timestamps unless the newer TQV has a different quality. For example, if
  /// you store a TQV <code>{T1, GOOD, V1}</code>, then storing <code>{T1, GOOD,
  /// V2}</code> replaces the existing TQV.
  /// </important>
  /// AWS IoT SiteWise authorizes access to each
  /// <code>BatchPutAssetPropertyValue</code> entry individually. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-batchputassetpropertyvalue-action">BatchPutAssetPropertyValue
  /// authorization</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [entries] :
  /// The list of asset property value entries for the batch put request. You
  /// can specify up to 10 entries per request.
  Future<BatchPutAssetPropertyValueResponse> batchPutAssetPropertyValue({
    required List<PutAssetPropertyValueEntry> entries,
  }) async {
    ArgumentError.checkNotNull(entries, 'entries');
    final $payload = <String, dynamic>{
      'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/properties',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutAssetPropertyValueResponse.fromJson(response);
  }

  /// Creates an access policy that grants the specified identity (AWS SSO user,
  /// AWS SSO group, or IAM user) access to the specified AWS IoT SiteWise
  /// Monitor portal or project resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accessPolicyIdentity] :
  /// The identity for this access policy. Choose an AWS SSO user, an AWS SSO
  /// group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The AWS IoT SiteWise Monitor resource for this access policy. Choose
  /// either a portal or a project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the access policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAccessPolicyResponse> createAccessPolicy({
    required Identity accessPolicyIdentity,
    required Permission accessPolicyPermission,
    required Resource accessPolicyResource,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(accessPolicyIdentity, 'accessPolicyIdentity');
    ArgumentError.checkNotNull(
        accessPolicyPermission, 'accessPolicyPermission');
    ArgumentError.checkNotNull(accessPolicyResource, 'accessPolicyResource');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission.toValue(),
      'accessPolicyResource': accessPolicyResource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/access-policies',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPolicyResponse.fromJson(response);
  }

  /// Creates an asset from an existing asset model. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-assets.html">Creating
  /// assets</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model from which to create the asset.
  ///
  /// Parameter [assetName] :
  /// A unique, friendly name for the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the asset. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAssetResponse> createAsset({
    required String assetModelId,
    required String assetName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetName, 'assetName');
    _s.validateStringLength(
      'assetName',
      assetName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetModelId': assetModelId,
      'assetName': assetName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetResponse.fromJson(response);
  }

  /// Creates an asset model from specified property and hierarchy definitions.
  /// You create assets from asset models. With asset models, you can easily
  /// create assets of the same type that have standardized definitions. Each
  /// asset created from a model inherits the asset model's property and
  /// hierarchy definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/define-models.html">Defining
  /// asset models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelName] :
  /// A unique, friendly name for the asset model.
  ///
  /// Parameter [assetModelCompositeModels] :
  /// The composite asset models that are part of this asset model. Composite
  /// asset models are asset models that contain specific properties. Each
  /// composite model has a type that defines the properties that the composite
  /// model supports. Use composite asset models to define alarms on this asset
  /// model.
  ///
  /// Parameter [assetModelDescription] :
  /// A description for the asset model.
  ///
  /// Parameter [assetModelHierarchies] :
  /// The hierarchy definitions of the asset model. Each hierarchy specifies an
  /// asset model whose assets can be children of any other assets created from
  /// this asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The property definitions of the asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the asset model. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateAssetModelResponse> createAssetModel({
    required String assetModelName,
    List<AssetModelCompositeModelDefinition>? assetModelCompositeModels,
    String? assetModelDescription,
    List<AssetModelHierarchyDefinition>? assetModelHierarchies,
    List<AssetModelPropertyDefinition>? assetModelProperties,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(assetModelName, 'assetModelName');
    _s.validateStringLength(
      'assetModelName',
      assetModelName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'assetModelDescription',
      assetModelDescription,
      1,
      2048,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetModelName': assetModelName,
      if (assetModelCompositeModels != null)
        'assetModelCompositeModels': assetModelCompositeModels,
      if (assetModelDescription != null)
        'assetModelDescription': assetModelDescription,
      if (assetModelHierarchies != null)
        'assetModelHierarchies': assetModelHierarchies,
      if (assetModelProperties != null)
        'assetModelProperties': assetModelProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/asset-models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssetModelResponse.fromJson(response);
  }

  /// Creates a dashboard in an AWS IoT SiteWise Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [dashboardDefinition] :
  /// The dashboard definition specified in a JSON literal. For detailed
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [dashboardName] :
  /// A friendly name for the dashboard.
  ///
  /// Parameter [projectId] :
  /// The ID of the project in which to create the dashboard.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [dashboardDescription] :
  /// A description for the dashboard.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the dashboard. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateDashboardResponse> createDashboard({
    required String dashboardDefinition,
    required String dashboardName,
    required String projectId,
    String? clientToken,
    String? dashboardDescription,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(dashboardDefinition, 'dashboardDefinition');
    _s.validateStringLength(
      'dashboardDefinition',
      dashboardDefinition,
      0,
      204800,
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardName, 'dashboardName');
    _s.validateStringLength(
      'dashboardName',
      dashboardName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'dashboardDescription',
      dashboardDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'dashboardDefinition': dashboardDefinition,
      'dashboardName': dashboardName,
      'projectId': projectId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dashboardDescription != null)
        'dashboardDescription': dashboardDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dashboards',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDashboardResponse.fromJson(response);
  }

  /// Creates a gateway, which is a virtual or edge device that delivers
  /// industrial data streams from local servers to AWS IoT SiteWise. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
  /// data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gatewayName] :
  /// A unique, friendly name for the gateway.
  ///
  /// Parameter [gatewayPlatform] :
  /// The gateway's platform. You can only specify one platform in a gateway.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateGatewayResponse> createGateway({
    required String gatewayName,
    required GatewayPlatform gatewayPlatform,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(gatewayName, 'gatewayName');
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayPlatform, 'gatewayPlatform');
    final $payload = <String, dynamic>{
      'gatewayName': gatewayName,
      'gatewayPlatform': gatewayPlatform,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/20200301/gateways',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGatewayResponse.fromJson(response);
  }

  /// Creates a portal, which can contain projects and dashboards. AWS IoT
  /// SiteWise Monitor uses AWS SSO or IAM to authenticate portal users and
  /// manage user permissions.
  /// <note>
  /// Before you can sign in to a new portal, you must add at least one identity
  /// to that portal. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/administer-portals.html#portal-change-admins">Adding
  /// or removing portal administrators</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portalContactEmail] :
  /// The AWS administrator's contact email address.
  ///
  /// Parameter [portalName] :
  /// A friendly name for the portal.
  ///
  /// Parameter [roleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of a service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [portalAuthMode] :
  /// The service to use to authenticate users to the portal. Choose from the
  /// following options:
  ///
  /// <ul>
  /// <li>
  /// <code>SSO</code> – The portal uses AWS Single Sign-On to authenticate
  /// users and manage user permissions. Before you can create a portal that
  /// uses AWS SSO, you must enable AWS SSO. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-get-started.html#mon-gs-sso">Enabling
  /// AWS SSO</a> in the <i>AWS IoT SiteWise User Guide</i>. This option is only
  /// available in AWS Regions other than the China Regions.
  /// </li>
  /// <li>
  /// <code>IAM</code> – The portal uses AWS Identity and Access Management
  /// (IAM) to authenticate users and manage user permissions. This option is
  /// only available in the China Regions.
  /// </li>
  /// </ul>
  /// You can't change this value after you create a portal.
  ///
  /// Default: <code>SSO</code>
  ///
  /// Parameter [portalDescription] :
  /// A description for the portal.
  ///
  /// Parameter [portalLogoImageFile] :
  /// A logo image to display in the portal. Upload a square, high-resolution
  /// image. The image is displayed on a dark background.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the portal. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreatePortalResponse> createPortal({
    required String portalContactEmail,
    required String portalName,
    required String roleArn,
    String? clientToken,
    AuthMode? portalAuthMode,
    String? portalDescription,
    ImageFile? portalLogoImageFile,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(portalContactEmail, 'portalContactEmail');
    _s.validateStringLength(
      'portalContactEmail',
      portalContactEmail,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalName, 'portalName');
    _s.validateStringLength(
      'portalName',
      portalName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'portalDescription',
      portalDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (portalAuthMode != null) 'portalAuthMode': portalAuthMode.toValue(),
      if (portalDescription != null) 'portalDescription': portalDescription,
      if (portalLogoImageFile != null)
        'portalLogoImageFile': portalLogoImageFile,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/portals',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePortalResponse.fromJson(response);
  }

  /// Creates a project in the specified portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal in which to create the project.
  ///
  /// Parameter [projectName] :
  /// A friendly name for the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [projectDescription] :
  /// A description for the project.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the project. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<CreateProjectResponse> createProject({
    required String portalId,
    required String projectName,
    String? clientToken,
    String? projectDescription,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'projectDescription',
      projectDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'portalId': portalId,
      'projectName': projectName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (projectDescription != null) 'projectDescription': projectDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/projects',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProjectResponse.fromJson(response);
  }

  /// Deletes an access policy that grants the specified identity access to the
  /// specified AWS IoT SiteWise Monitor resource. You can use this operation to
  /// revoke access to an AWS IoT SiteWise Monitor resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy to be deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteAccessPolicy({
    required String accessPolicyId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an asset. This action can't be undone. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  /// <note>
  /// You can't delete an asset that's associated to another asset. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DisassociateAssets.html">DisassociateAssets</a>.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeleteAssetResponse> deleteAsset({
    required String assetId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssetResponse.fromJson(response);
  }

  /// Deletes an asset model. This action can't be undone. You must delete all
  /// assets created from an asset model before you can delete the model. Also,
  /// you can't delete an asset model if a parent asset model exists that
  /// contains a property formula expression that depends on the asset model
  /// that you want to delete. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/delete-assets-and-models.html">Deleting
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeleteAssetModelResponse> deleteAssetModel({
    required String assetModelId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssetModelResponse.fromJson(response);
  }

  /// Deletes a dashboard from AWS IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteDashboard({
    required String dashboardId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a gateway from AWS IoT SiteWise. When you delete a gateway, some
  /// of the gateway's files remain in your gateway's file system.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to delete.
  Future<void> deleteGateway({
    required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a portal from AWS IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<DeletePortalResponse> deletePortal({
    required String portalId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePortalResponse.fromJson(response);
  }

  /// Deletes a project from AWS IoT SiteWise Monitor.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> deleteProject({
    required String projectId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes an access policy, which specifies an identity's access to an AWS
  /// IoT SiteWise Monitor portal or project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy.
  Future<DescribeAccessPolicyResponse> describeAccessPolicy({
    required String accessPolicyId,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccessPolicyResponse.fromJson(response);
  }

  /// Retrieves information about an asset.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  Future<DescribeAssetResponse> describeAsset({
    required String assetId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetResponse.fromJson(response);
  }

  /// Retrieves information about an asset model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model.
  Future<DescribeAssetModelResponse> describeAssetModel({
    required String assetModelId,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetModelResponse.fromJson(response);
  }

  /// Retrieves information about an asset property.
  /// <note>
  /// When you call this operation for an attribute property, this response
  /// includes the default attribute value that you define in the asset model.
  /// If you update the default value in the model, this operation's response
  /// includes the new default value.
  /// </note>
  /// This operation doesn't return the value of the asset property. To get the
  /// value of an asset property, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_GetAssetPropertyValue.html">GetAssetPropertyValue</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<DescribeAssetPropertyResponse> describeAssetProperty({
    required String assetId,
    required String propertyId,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(propertyId, 'propertyId');
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAssetPropertyResponse.fromJson(response);
  }

  /// Retrieves information about a dashboard.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard.
  Future<DescribeDashboardResponse> describeDashboard({
    required String dashboardId,
  }) async {
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDashboardResponse.fromJson(response);
  }

  /// Retrieves information about the default encryption configuration for the
  /// AWS account in the default or specified region. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  Future<DescribeDefaultEncryptionConfigurationResponse>
      describeDefaultEncryptionConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about a gateway.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway device.
  Future<DescribeGatewayResponse> describeGateway({
    required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayResponse.fromJson(response);
  }

  /// Retrieves information about a gateway capability configuration. Each
  /// gateway capability defines data sources for a gateway. A capability
  /// configuration can contain multiple data source configurations. If you
  /// define OPC-UA sources for a gateway in the AWS IoT SiteWise console, all
  /// of your OPC-UA sources are stored in one capability configuration. To list
  /// all capability configurations for a gateway, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [capabilityNamespace] :
  /// The namespace of the capability configuration. For example, if you
  /// configure OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA
  /// capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway that defines the capability configuration.
  Future<DescribeGatewayCapabilityConfigurationResponse>
      describeGatewayCapabilityConfiguration({
    required String capabilityNamespace,
    required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(capabilityNamespace, 'capabilityNamespace');
    _s.validateStringLength(
      'capabilityNamespace',
      capabilityNamespace,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/20200301/gateways/${Uri.encodeComponent(gatewayId)}/capability/${Uri.encodeComponent(capabilityNamespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayCapabilityConfigurationResponse.fromJson(response);
  }

  /// Retrieves the current AWS IoT SiteWise logging options.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  Future<DescribeLoggingOptionsResponse> describeLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingOptionsResponse.fromJson(response);
  }

  /// Retrieves information about a portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal.
  Future<DescribePortalResponse> describePortal({
    required String portalId,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePortalResponse.fromJson(response);
  }

  /// Retrieves information about a project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  Future<DescribeProjectResponse> describeProject({
    required String projectId,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProjectResponse.fromJson(response);
  }

  /// Disassociates a child asset from the given parent asset through a
  /// hierarchy defined in the parent asset's model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the parent asset from which to disassociate the child asset.
  ///
  /// Parameter [childAssetId] :
  /// The ID of the child asset to disassociate.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of a hierarchy in the parent asset's model. Hierarchies allow
  /// different groupings of assets to be formed that all come from the same
  /// asset model. You can use the hierarchy ID to identify the correct asset to
  /// disassociate. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> disassociateAssets({
    required String assetId,
    required String childAssetId,
    required String hierarchyId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(childAssetId, 'childAssetId');
    _s.validateStringLength(
      'childAssetId',
      childAssetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(hierarchyId, 'hierarchyId');
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'childAssetId': childAssetId,
      'hierarchyId': hierarchyId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets aggregated values for an asset property. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#aggregates">Querying
  /// aggregates</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [aggregateTypes] :
  /// The data aggregating function.
  ///
  /// Parameter [endDate] :
  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [resolution] :
  /// The time interval over which to aggregate data.
  ///
  /// Parameter [startDate] :
  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 100
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [qualities] :
  /// The quality by which to filter asset data.
  ///
  /// Parameter [timeOrdering] :
  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  Future<GetAssetPropertyAggregatesResponse> getAssetPropertyAggregates({
    required List<AggregateType> aggregateTypes,
    required DateTime endDate,
    required String resolution,
    required DateTime startDate,
    String? assetId,
    int? maxResults,
    String? nextToken,
    String? propertyAlias,
    String? propertyId,
    List<Quality>? qualities,
    TimeOrdering? timeOrdering,
  }) async {
    ArgumentError.checkNotNull(aggregateTypes, 'aggregateTypes');
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(resolution, 'resolution');
    _s.validateStringLength(
      'resolution',
      resolution,
      2,
      2,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startDate, 'startDate');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    final $query = <String, List<String>>{
      'aggregateTypes': aggregateTypes.map((e) => e.toValue()).toList(),
      'endDate': [_s.iso8601ToJson(endDate).toString()],
      'resolution': [resolution],
      'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (assetId != null) 'assetId': [assetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (timeOrdering != null) 'timeOrdering': [timeOrdering.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/aggregates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyAggregatesResponse.fromJson(response);
  }

  /// Gets an asset property's current value. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#current-values">Querying
  /// current values</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  Future<GetAssetPropertyValueResponse> getAssetPropertyValue({
    String? assetId,
    String? propertyAlias,
    String? propertyId,
  }) async {
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    final $query = <String, List<String>>{
      if (assetId != null) 'assetId': [assetId],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/latest',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyValueResponse.fromJson(response);
  }

  /// Gets the history of an asset property's values. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/query-industrial-data.html#historical-values">Querying
  /// historical values</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// To identify an asset property, you must specify one of the following:
  ///
  /// <ul>
  /// <li>
  /// The <code>assetId</code> and <code>propertyId</code> of an asset property.
  /// </li>
  /// <li>
  /// A <code>propertyAlias</code>, which is a data stream alias (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). To define an
  /// asset property's alias, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [endDate] :
  /// The inclusive end of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 100
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property.
  ///
  /// Parameter [qualities] :
  /// The quality by which to filter asset data.
  ///
  /// Parameter [startDate] :
  /// The exclusive start of the range from which to query historical data,
  /// expressed in seconds in Unix epoch time.
  ///
  /// Parameter [timeOrdering] :
  /// The chronological sorting order of the requested information.
  ///
  /// Default: <code>ASCENDING</code>
  Future<GetAssetPropertyValueHistoryResponse> getAssetPropertyValueHistory({
    String? assetId,
    DateTime? endDate,
    int? maxResults,
    String? nextToken,
    String? propertyAlias,
    String? propertyId,
    List<Quality>? qualities,
    DateTime? startDate,
    TimeOrdering? timeOrdering,
  }) async {
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      2048,
    );
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
    );
    final $query = <String, List<String>>{
      if (assetId != null) 'assetId': [assetId],
      if (endDate != null) 'endDate': [_s.iso8601ToJson(endDate).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (propertyAlias != null) 'propertyAlias': [propertyAlias],
      if (propertyId != null) 'propertyId': [propertyId],
      if (qualities != null)
        'qualities': qualities.map((e) => e.toValue()).toList(),
      if (startDate != null)
        'startDate': [_s.iso8601ToJson(startDate).toString()],
      if (timeOrdering != null) 'timeOrdering': [timeOrdering.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/properties/history',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetPropertyValueHistoryResponse.fromJson(response);
  }

  /// Retrieves a paginated list of access policies for an identity (an AWS SSO
  /// user, an AWS SSO group, or an IAM user) or an AWS IoT SiteWise Monitor
  /// resource (a portal or project).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [iamArn] :
  /// The ARN of the IAM user. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>. This parameter is required if you
  /// specify <code>IAM</code> for <code>identityType</code>.
  ///
  /// Parameter [identityId] :
  /// The ID of the identity. This parameter is required if you specify
  /// <code>USER</code> or <code>GROUP</code> for <code>identityType</code>.
  ///
  /// Parameter [identityType] :
  /// The type of identity (AWS SSO user, AWS SSO group, or IAM user). This
  /// parameter is required if you specify <code>identityId</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [resourceId] :
  /// The ID of the resource. This parameter is required if you specify
  /// <code>resourceType</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of resource (portal or project). This parameter is required if
  /// you specify <code>resourceId</code>.
  Future<ListAccessPoliciesResponse> listAccessPolicies({
    String? iamArn,
    String? identityId,
    IdentityType? identityType,
    int? maxResults,
    String? nextToken,
    String? resourceId,
    ResourceType? resourceType,
  }) async {
    _s.validateStringLength(
      'iamArn',
      iamArn,
      1,
      1600,
    );
    _s.validateStringLength(
      'identityId',
      identityId,
      1,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      36,
      36,
    );
    final $query = <String, List<String>>{
      if (iamArn != null) 'iamArn': [iamArn],
      if (identityId != null) 'identityId': [identityId],
      if (identityType != null) 'identityType': [identityType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceId != null) 'resourceId': [resourceId],
      if (resourceType != null) 'resourceType': [resourceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPoliciesResponse.fromJson(response);
  }

  /// Retrieves a paginated list of summaries of all asset models.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetModelsResponse> listAssetModels({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/asset-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetModelsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of asset relationships for an asset. You can
  /// use this operation to identify an asset's root asset and all associated
  /// assets between that asset and its root.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset.
  ///
  /// Parameter [traversalType] :
  /// The type of traversal to use to identify asset relationships. Choose the
  /// following option:
  ///
  /// <ul>
  /// <li>
  /// <code>PATH_TO_ROOT</code> – Identify the asset's parent assets up to the
  /// root asset. The asset that you specify in <code>assetId</code> is the
  /// first result in the list of <code>assetRelationshipSummaries</code>, and
  /// the root asset is the last result.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetRelationshipsResponse> listAssetRelationships({
    required String assetId,
    required TraversalType traversalType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(traversalType, 'traversalType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      'traversalType': [traversalType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/assetRelationships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetRelationshipsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of asset summaries.
  ///
  /// You can use this operation to do the following:
  ///
  /// <ul>
  /// <li>
  /// List assets based on a specific asset model.
  /// </li>
  /// <li>
  /// List top-level assets.
  /// </li>
  /// </ul>
  /// You can't use this operation to list all assets. To retrieve summaries for
  /// all of your assets, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_ListAssetModels.html">ListAssetModels</a>
  /// to get all of your asset model IDs. Then, use ListAssets to get all assets
  /// for each asset model.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model by which to filter the list of assets. This
  /// parameter is required if you choose <code>ALL</code> for
  /// <code>filter</code>.
  ///
  /// Parameter [filter] :
  /// The filter for the requested list of assets. Choose one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code> – The list includes all assets for a given asset model
  /// ID. The <code>assetModelId</code> parameter is required if you filter by
  /// <code>ALL</code>.
  /// </li>
  /// <li>
  /// <code>TOP_LEVEL</code> – The list includes only top-level assets in the
  /// asset hierarchy tree.
  /// </li>
  /// </ul>
  /// Default: <code>ALL</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListAssetsResponse> listAssets({
    String? assetModelId,
    ListAssetsFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (assetModelId != null) 'assetModelId': [assetModelId],
      if (filter != null) 'filter': [filter.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of associated assets.
  ///
  /// You can use this operation to do the following:
  ///
  /// <ul>
  /// <li>
  /// List child assets associated to a parent asset by a hierarchy that you
  /// specify.
  /// </li>
  /// <li>
  /// List an asset's parent asset.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to query.
  ///
  /// Parameter [hierarchyId] :
  /// The ID of the hierarchy by which child assets are associated to the asset.
  /// To find a hierarchy ID, use the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAsset.html">DescribeAsset</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>
  /// operations. This parameter is required if you choose <code>CHILD</code>
  /// for <code>traversalDirection</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  ///
  /// Parameter [traversalDirection] :
  /// The direction to list associated assets. Choose one of the following
  /// options:
  ///
  /// <ul>
  /// <li>
  /// <code>CHILD</code> – The list includes all child assets associated to the
  /// asset. The <code>hierarchyId</code> parameter is required if you choose
  /// <code>CHILD</code>.
  /// </li>
  /// <li>
  /// <code>PARENT</code> – The list includes the asset's parent asset.
  /// </li>
  /// </ul>
  /// Default: <code>CHILD</code>
  Future<ListAssociatedAssetsResponse> listAssociatedAssets({
    required String assetId,
    String? hierarchyId,
    int? maxResults,
    String? nextToken,
    TraversalDirection? traversalDirection,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'hierarchyId',
      hierarchyId,
      36,
      36,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (hierarchyId != null) 'hierarchyId': [hierarchyId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (traversalDirection != null)
        'traversalDirection': [traversalDirection.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}/hierarchies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssociatedAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of dashboards for an AWS IoT SiteWise Monitor
  /// project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListDashboardsResponse> listDashboards({
    required String projectId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      'projectId': [projectId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dashboards',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDashboardsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of gateways.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListGatewaysResponse> listGateways({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/20200301/gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGatewaysResponse.fromJson(response);
  }

  /// Retrieves a paginated list of AWS IoT SiteWise Monitor portals.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListPortalsResponse> listPortals({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/portals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPortalsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of assets associated with an AWS IoT SiteWise
  /// Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectAssetsResponse> listProjectAssets({
    required String projectId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectAssetsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of projects for an AWS IoT SiteWise Monitor
  /// portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [portalId] :
  /// The ID of the portal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per paginated request.
  ///
  /// Default: 50
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results.
  Future<ListProjectsResponse> listProjects({
    required String portalId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    final $query = <String, List<String>>{
      'portalId': [portalId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/projects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProjectsResponse.fromJson(response);
  }

  /// Retrieves the list of tags for an AWS IoT SiteWise resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Sets the default encryption configuration for the AWS account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/key-management.html">Key
  /// management</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [encryptionType] :
  /// The type of encryption used for the encryption configuration.
  ///
  /// Parameter [kmsKeyId] :
  /// The Key ID of the customer managed customer master key (CMK) used for AWS
  /// KMS encryption. This is required if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  Future<PutDefaultEncryptionConfigurationResponse>
      putDefaultEncryptionConfiguration({
    required EncryptionType encryptionType,
    String? kmsKeyId,
  }) async {
    ArgumentError.checkNotNull(encryptionType, 'encryptionType');
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'encryptionType': encryptionType.toValue(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/account/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return PutDefaultEncryptionConfigurationResponse.fromJson(response);
  }

  /// Sets logging options for AWS IoT SiteWise.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictingOperationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [loggingOptions] :
  /// The logging options to set.
  Future<void> putLoggingOptions({
    required LoggingOptions loggingOptions,
  }) async {
    ArgumentError.checkNotNull(loggingOptions, 'loggingOptions');
    final $payload = <String, dynamic>{
      'loggingOptions': loggingOptions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to an AWS IoT SiteWise resource. If a tag already exists for the
  /// resource, this operation updates the tag's value.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to tag.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from an AWS IoT SiteWise resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [resourceArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys for tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing access policy that specifies an identity's access to
  /// an AWS IoT SiteWise Monitor portal or project resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [accessPolicyId] :
  /// The ID of the access policy.
  ///
  /// Parameter [accessPolicyIdentity] :
  /// The identity for this access policy. Choose an AWS SSO user, an AWS SSO
  /// group, or an IAM user.
  ///
  /// Parameter [accessPolicyPermission] :
  /// The permission level for this access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  ///
  /// Parameter [accessPolicyResource] :
  /// The AWS IoT SiteWise Monitor resource for this access policy. Choose
  /// either a portal or a project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<void> updateAccessPolicy({
    required String accessPolicyId,
    required Identity accessPolicyIdentity,
    required Permission accessPolicyPermission,
    required Resource accessPolicyResource,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(accessPolicyId, 'accessPolicyId');
    _s.validateStringLength(
      'accessPolicyId',
      accessPolicyId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(accessPolicyIdentity, 'accessPolicyIdentity');
    ArgumentError.checkNotNull(
        accessPolicyPermission, 'accessPolicyPermission');
    ArgumentError.checkNotNull(accessPolicyResource, 'accessPolicyResource');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'accessPolicyIdentity': accessPolicyIdentity,
      'accessPolicyPermission': accessPolicyPermission.toValue(),
      'accessPolicyResource': accessPolicyResource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/access-policies/${Uri.encodeComponent(accessPolicyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an asset's name. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to update.
  ///
  /// Parameter [assetName] :
  /// A unique, friendly name for the asset.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetResponse> updateAsset({
    required String assetId,
    required String assetName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetName, 'assetName');
    _s.validateStringLength(
      'assetName',
      assetName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetName': assetName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assets/${Uri.encodeComponent(assetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssetResponse.fromJson(response);
  }

  /// Updates an asset model and all of the assets that were created from the
  /// model. Each asset created from the model inherits the updated asset
  /// model's property and hierarchy definitions. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-assets-and-models.html">Updating
  /// assets and models</a> in the <i>AWS IoT SiteWise User Guide</i>.
  /// <important>
  /// This operation overwrites the existing model with the provided model. To
  /// avoid deleting your asset model's properties or hierarchies, you must
  /// include their IDs and definitions in the updated asset model payload. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetModel.html">DescribeAssetModel</a>.
  ///
  /// If you remove a property from an asset model, AWS IoT SiteWise deletes all
  /// previous data for that property. If you remove a hierarchy definition from
  /// an asset model, AWS IoT SiteWise disassociates every asset associated with
  /// that hierarchy. You can't change the type or data type of an existing
  /// property.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetModelId] :
  /// The ID of the asset model to update.
  ///
  /// Parameter [assetModelName] :
  /// A unique, friendly name for the asset model.
  ///
  /// Parameter [assetModelCompositeModels] :
  /// The composite asset models that are part of this asset model. Composite
  /// asset models are asset models that contain specific properties. Each
  /// composite model has a type that defines the properties that the composite
  /// model supports. Use composite asset models to define alarms on this asset
  /// model.
  ///
  /// Parameter [assetModelDescription] :
  /// A description for the asset model.
  ///
  /// Parameter [assetModelHierarchies] :
  /// The updated hierarchy definitions of the asset model. Each hierarchy
  /// specifies an asset model whose assets can be children of any other assets
  /// created from this asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 10 hierarchies per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [assetModelProperties] :
  /// The updated property definitions of the asset model. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html">Asset
  /// properties</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// You can specify up to 200 properties per asset model. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  Future<UpdateAssetModelResponse> updateAssetModel({
    required String assetModelId,
    required String assetModelName,
    List<AssetModelCompositeModel>? assetModelCompositeModels,
    String? assetModelDescription,
    List<AssetModelHierarchy>? assetModelHierarchies,
    List<AssetModelProperty>? assetModelProperties,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assetModelId, 'assetModelId');
    _s.validateStringLength(
      'assetModelId',
      assetModelId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(assetModelName, 'assetModelName');
    _s.validateStringLength(
      'assetModelName',
      assetModelName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'assetModelDescription',
      assetModelDescription,
      1,
      2048,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    final $payload = <String, dynamic>{
      'assetModelName': assetModelName,
      if (assetModelCompositeModels != null)
        'assetModelCompositeModels': assetModelCompositeModels,
      if (assetModelDescription != null)
        'assetModelDescription': assetModelDescription,
      if (assetModelHierarchies != null)
        'assetModelHierarchies': assetModelHierarchies,
      if (assetModelProperties != null)
        'assetModelProperties': assetModelProperties,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/asset-models/${Uri.encodeComponent(assetModelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssetModelResponse.fromJson(response);
  }

  /// Updates an asset property's alias and notification state.
  /// <important>
  /// This operation overwrites the property's existing alias and notification
  /// state. To keep your existing property's alias or notification state, you
  /// must include the existing values in the UpdateAssetProperty request. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeAssetProperty.html">DescribeAssetProperty</a>.
  /// </important>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [assetId] :
  /// The ID of the asset to be updated.
  ///
  /// Parameter [propertyId] :
  /// The ID of the asset property to be updated.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [propertyAlias] :
  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// If you omit this parameter, the alias is removed from the property.
  ///
  /// Parameter [propertyNotificationState] :
  /// The MQTT notification state (enabled or disabled) for this asset property.
  /// When the notification state is enabled, AWS IoT SiteWise publishes
  /// property value updates to a unique MQTT topic. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
  /// with other services</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// If you omit this parameter, the notification state is set to
  /// <code>DISABLED</code>.
  Future<void> updateAssetProperty({
    required String assetId,
    required String propertyId,
    String? clientToken,
    String? propertyAlias,
    PropertyNotificationState? propertyNotificationState,
  }) async {
    ArgumentError.checkNotNull(assetId, 'assetId');
    _s.validateStringLength(
      'assetId',
      assetId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(propertyId, 'propertyId');
    _s.validateStringLength(
      'propertyId',
      propertyId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'propertyAlias',
      propertyAlias,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyNotificationState != null)
        'propertyNotificationState': propertyNotificationState.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assets/${Uri.encodeComponent(assetId)}/properties/${Uri.encodeComponent(propertyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an AWS IoT SiteWise Monitor dashboard.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dashboardDefinition] :
  /// The new dashboard definition, as specified in a JSON literal. For detailed
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [dashboardId] :
  /// The ID of the dashboard to update.
  ///
  /// Parameter [dashboardName] :
  /// A new friendly name for the dashboard.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [dashboardDescription] :
  /// A new description for the dashboard.
  Future<void> updateDashboard({
    required String dashboardDefinition,
    required String dashboardId,
    required String dashboardName,
    String? clientToken,
    String? dashboardDescription,
  }) async {
    ArgumentError.checkNotNull(dashboardDefinition, 'dashboardDefinition');
    _s.validateStringLength(
      'dashboardDefinition',
      dashboardDefinition,
      0,
      204800,
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardId, 'dashboardId');
    _s.validateStringLength(
      'dashboardId',
      dashboardId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(dashboardName, 'dashboardName');
    _s.validateStringLength(
      'dashboardName',
      dashboardName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'dashboardDescription',
      dashboardDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'dashboardDefinition': dashboardDefinition,
      'dashboardName': dashboardName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dashboardDescription != null)
        'dashboardDescription': dashboardDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/dashboards/${Uri.encodeComponent(dashboardId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a gateway's name.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to update.
  ///
  /// Parameter [gatewayName] :
  /// A unique, friendly name for the gateway.
  Future<void> updateGateway({
    required String gatewayId,
    required String gatewayName,
  }) async {
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayName, 'gatewayName');
    _s.validateStringLength(
      'gatewayName',
      gatewayName,
      1,
      256,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'gatewayName': gatewayName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/20200301/gateways/${Uri.encodeComponent(gatewayId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a gateway capability configuration or defines a new capability
  /// configuration. Each gateway capability defines data sources for a gateway.
  /// A capability configuration can contain multiple data source
  /// configurations. If you define OPC-UA sources for a gateway in the AWS IoT
  /// SiteWise console, all of your OPC-UA sources are stored in one capability
  /// configuration. To list all capability configurations for a gateway, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGateway.html">DescribeGateway</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictingOperationException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [capabilityConfiguration] :
  /// The JSON document that defines the configuration for the gateway
  /// capability. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring
  /// data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  ///
  /// Parameter [capabilityNamespace] :
  /// The namespace of the gateway capability configuration to be updated. For
  /// example, if you configure OPC-UA sources from the AWS IoT SiteWise
  /// console, your OPC-UA capability configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where
  /// <code>version</code> is a number such as <code>1</code>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the gateway to be updated.
  Future<UpdateGatewayCapabilityConfigurationResponse>
      updateGatewayCapabilityConfiguration({
    required String capabilityConfiguration,
    required String capabilityNamespace,
    required String gatewayId,
  }) async {
    ArgumentError.checkNotNull(
        capabilityConfiguration, 'capabilityConfiguration');
    _s.validateStringLength(
      'capabilityConfiguration',
      capabilityConfiguration,
      1,
      104857600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(capabilityNamespace, 'capabilityNamespace');
    _s.validateStringLength(
      'capabilityNamespace',
      capabilityNamespace,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    _s.validateStringLength(
      'gatewayId',
      gatewayId,
      36,
      36,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'capabilityConfiguration': capabilityConfiguration,
      'capabilityNamespace': capabilityNamespace,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/20200301/gateways/${Uri.encodeComponent(gatewayId)}/capability',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGatewayCapabilityConfigurationResponse.fromJson(response);
  }

  /// Updates an AWS IoT SiteWise Monitor portal.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingOperationException].
  ///
  /// Parameter [portalContactEmail] :
  /// The AWS administrator's contact email address.
  ///
  /// Parameter [portalId] :
  /// The ID of the portal to update.
  ///
  /// Parameter [portalName] :
  /// A new friendly name for the portal.
  ///
  /// Parameter [roleArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of a service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [portalDescription] :
  /// A new description for the portal.
  Future<UpdatePortalResponse> updatePortal({
    required String portalContactEmail,
    required String portalId,
    required String portalName,
    required String roleArn,
    String? clientToken,
    String? portalDescription,
    Image? portalLogoImage,
  }) async {
    ArgumentError.checkNotNull(portalContactEmail, 'portalContactEmail');
    _s.validateStringLength(
      'portalContactEmail',
      portalContactEmail,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalId, 'portalId');
    _s.validateStringLength(
      'portalId',
      portalId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(portalName, 'portalName');
    _s.validateStringLength(
      'portalName',
      portalName,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'portalDescription',
      portalDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'portalContactEmail': portalContactEmail,
      'portalName': portalName,
      'roleArn': roleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (portalDescription != null) 'portalDescription': portalDescription,
      if (portalLogoImage != null) 'portalLogoImage': portalLogoImage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePortalResponse.fromJson(response);
  }

  /// Updates an AWS IoT SiteWise Monitor project.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [projectId] :
  /// The ID of the project to update.
  ///
  /// Parameter [projectName] :
  /// A new friendly name for the project.
  ///
  /// Parameter [clientToken] :
  /// A unique case-sensitive identifier that you can provide to ensure the
  /// idempotency of the request. Don't reuse this client token if a new
  /// idempotent request is required.
  ///
  /// Parameter [projectDescription] :
  /// A new description for the project.
  Future<void> updateProject({
    required String projectId,
    required String projectName,
    String? clientToken,
    String? projectDescription,
  }) async {
    ArgumentError.checkNotNull(projectId, 'projectId');
    _s.validateStringLength(
      'projectId',
      projectId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(projectName, 'projectName');
    _s.validateStringLength(
      'projectName',
      projectName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      36,
      64,
    );
    _s.validateStringLength(
      'projectDescription',
      projectDescription,
      1,
      2048,
    );
    final $payload = <String, dynamic>{
      'projectName': projectName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (projectDescription != null) 'projectDescription': projectDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/projects/${Uri.encodeComponent(projectId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Contains an access policy that defines an identity's access to an AWS IoT
/// SiteWise Monitor resource.
class AccessPolicySummary {
  /// The ID of the access policy.
  final String id;

  /// The identity (an AWS SSO user, an AWS SSO group, or an IAM user).
  final Identity identity;

  /// The permissions for the access policy. Note that a project
  /// <code>ADMINISTRATOR</code> is also known as a project owner.
  final Permission permission;

  /// The AWS IoT SiteWise Monitor resource (a portal or project).
  final Resource resource;

  /// The date the access policy was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The date the access policy was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  AccessPolicySummary({
    required this.id,
    required this.identity,
    required this.permission,
    required this.resource,
    this.creationDate,
    this.lastUpdateDate,
  });
  factory AccessPolicySummary.fromJson(Map<String, dynamic> json) {
    return AccessPolicySummary(
      id: json['id'] as String,
      identity: Identity.fromJson(json['identity'] as Map<String, dynamic>),
      permission: (json['permission'] as String).toPermission(),
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
      creationDate: timeStampFromJson(json['creationDate']),
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }
}

enum AggregateType {
  average,
  count,
  maximum,
  minimum,
  sum,
  standardDeviation,
}

extension AggregateTypeValueExtension on AggregateType {
  String toValue() {
    switch (this) {
      case AggregateType.average:
        return 'AVERAGE';
      case AggregateType.count:
        return 'COUNT';
      case AggregateType.maximum:
        return 'MAXIMUM';
      case AggregateType.minimum:
        return 'MINIMUM';
      case AggregateType.sum:
        return 'SUM';
      case AggregateType.standardDeviation:
        return 'STANDARD_DEVIATION';
    }
  }
}

extension AggregateTypeFromString on String {
  AggregateType toAggregateType() {
    switch (this) {
      case 'AVERAGE':
        return AggregateType.average;
      case 'COUNT':
        return AggregateType.count;
      case 'MAXIMUM':
        return AggregateType.maximum;
      case 'MINIMUM':
        return AggregateType.minimum;
      case 'SUM':
        return AggregateType.sum;
      case 'STANDARD_DEVIATION':
        return AggregateType.standardDeviation;
    }
    throw Exception('$this is not known in enum AggregateType');
  }
}

/// Contains aggregated asset property values (for example, average, minimum,
/// and maximum).
class AggregatedValue {
  /// The date the aggregating computations occurred, in Unix epoch time.
  final DateTime timestamp;

  /// The value of the aggregates.
  final Aggregates value;

  /// The quality of the aggregated data.
  final Quality? quality;

  AggregatedValue({
    required this.timestamp,
    required this.value,
    this.quality,
  });
  factory AggregatedValue.fromJson(Map<String, dynamic> json) {
    return AggregatedValue(
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] as Object),
      value: Aggregates.fromJson(json['value'] as Map<String, dynamic>),
      quality: (json['quality'] as String?)?.toQuality(),
    );
  }
}

/// Contains the (pre-calculated) aggregate values for an asset property.
class Aggregates {
  /// The average (mean) value of the time series over a time interval window.
  final double? average;

  /// The count of data points in the time series over a time interval window.
  final double? count;

  /// The maximum value of the time series over a time interval window.
  final double? maximum;

  /// The minimum value of the time series over a time interval window.
  final double? minimum;

  /// The standard deviation of the time series over a time interval window.
  final double? standardDeviation;

  /// The sum of the time series over a time interval window.
  final double? sum;

  Aggregates({
    this.average,
    this.count,
    this.maximum,
    this.minimum,
    this.standardDeviation,
    this.sum,
  });
  factory Aggregates.fromJson(Map<String, dynamic> json) {
    return Aggregates(
      average: json['average'] as double?,
      count: json['count'] as double?,
      maximum: json['maximum'] as double?,
      minimum: json['minimum'] as double?,
      standardDeviation: json['standardDeviation'] as double?,
      sum: json['sum'] as double?,
    );
  }
}

/// Contains information about a composite model in an asset. This object
/// contains the asset's properties that you define in the composite model.
class AssetCompositeModel {
  /// The name of the composite model.
  final String name;

  /// The asset properties that this composite model defines.
  final List<AssetProperty> properties;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  AssetCompositeModel({
    required this.name,
    required this.properties,
    required this.type,
    this.description,
  });
  factory AssetCompositeModel.fromJson(Map<String, dynamic> json) {
    return AssetCompositeModel(
      name: json['name'] as String,
      properties: (json['properties'] as List)
          .whereNotNull()
          .map((e) => AssetProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      description: json['description'] as String?,
    );
  }
}

enum AssetErrorCode {
  internalFailure,
}

extension AssetErrorCodeValueExtension on AssetErrorCode {
  String toValue() {
    switch (this) {
      case AssetErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension AssetErrorCodeFromString on String {
  AssetErrorCode toAssetErrorCode() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return AssetErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum AssetErrorCode');
  }
}

/// Contains error details for the requested associate project asset action.
class AssetErrorDetails {
  /// The ID of the asset.
  final String assetId;

  /// The error code.
  final AssetErrorCode code;

  /// The error message.
  final String message;

  AssetErrorDetails({
    required this.assetId,
    required this.code,
    required this.message,
  });
  factory AssetErrorDetails.fromJson(Map<String, dynamic> json) {
    return AssetErrorDetails(
      assetId: json['assetId'] as String,
      code: (json['code'] as String).toAssetErrorCode(),
      message: json['message'] as String,
    );
  }
}

/// Describes an asset hierarchy that contains a hierarchy's name and ID.
class AssetHierarchy {
  /// The hierarchy name provided in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  final String name;

  /// The ID of the hierarchy. This ID is a <code>hierarchyId</code>.
  final String? id;

  AssetHierarchy({
    required this.name,
    this.id,
  });
  factory AssetHierarchy.fromJson(Map<String, dynamic> json) {
    return AssetHierarchy(
      name: json['name'] as String,
      id: json['id'] as String?,
    );
  }
}

/// Contains information about a parent asset and a child asset that are related
/// through an asset hierarchy.
class AssetHierarchyInfo {
  /// The ID of the child asset in this asset relationship.
  final String? childAssetId;

  /// The ID of the parent asset in this asset relationship.
  final String? parentAssetId;

  AssetHierarchyInfo({
    this.childAssetId,
    this.parentAssetId,
  });
  factory AssetHierarchyInfo.fromJson(Map<String, dynamic> json) {
    return AssetHierarchyInfo(
      childAssetId: json['childAssetId'] as String?,
      parentAssetId: json['parentAssetId'] as String?,
    );
  }
}

/// Contains information about a composite model in an asset model. This object
/// contains the asset property definitions that you define in the composite
/// model.
class AssetModelCompositeModel {
  /// The name of the composite model.
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  /// The asset property definitions for this composite model.
  final List<AssetModelProperty>? properties;

  AssetModelCompositeModel({
    required this.name,
    required this.type,
    this.description,
    this.properties,
  });
  factory AssetModelCompositeModel.fromJson(Map<String, dynamic> json) {
    return AssetModelCompositeModel(
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) => AssetModelProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    final properties = this.properties;
    return {
      'name': name,
      'type': type,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Contains a composite model definition in an asset model. This composite
/// model definition is applied to all assets created from the asset model.
class AssetModelCompositeModelDefinition {
  /// The name of the composite model.
  final String name;

  /// The type of the composite model. For alarm composite models, this type is
  /// <code>AWS/ALARM</code>.
  final String type;

  /// The description of the composite model.
  final String? description;

  /// The asset property definitions for this composite model.
  final List<AssetModelPropertyDefinition>? properties;

  AssetModelCompositeModelDefinition({
    required this.name,
    required this.type,
    this.description,
    this.properties,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final description = this.description;
    final properties = this.properties;
    return {
      'name': name,
      'type': type,
      if (description != null) 'description': description,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Describes an asset hierarchy that contains a hierarchy's name, ID, and child
/// asset model ID that specifies the type of asset that can be in this
/// hierarchy.
class AssetModelHierarchy {
  /// The ID of the asset model. All assets in this hierarchy must be instances of
  /// the <code>childAssetModelId</code> asset model.
  final String childAssetModelId;

  /// The name of the asset model hierarchy that you specify by using the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation.
  final String name;

  /// The ID of the asset model hierarchy. This ID is a <code>hierarchyId</code>.
  final String? id;

  AssetModelHierarchy({
    required this.childAssetModelId,
    required this.name,
    this.id,
  });
  factory AssetModelHierarchy.fromJson(Map<String, dynamic> json) {
    return AssetModelHierarchy(
      childAssetModelId: json['childAssetModelId'] as String,
      name: json['name'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final childAssetModelId = this.childAssetModelId;
    final name = this.name;
    final id = this.id;
    return {
      'childAssetModelId': childAssetModelId,
      'name': name,
      if (id != null) 'id': id,
    };
  }
}

/// Contains an asset model hierarchy used in asset model creation. An asset
/// model hierarchy determines the kind (or type) of asset that can belong to a
/// hierarchy.
class AssetModelHierarchyDefinition {
  /// The ID of an asset model for this hierarchy.
  final String childAssetModelId;

  /// The name of the asset model hierarchy definition (as specified in the <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_CreateAssetModel.html">CreateAssetModel</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetModel.html">UpdateAssetModel</a>
  /// API operation).
  final String name;

  AssetModelHierarchyDefinition({
    required this.childAssetModelId,
    required this.name,
  });
  Map<String, dynamic> toJson() {
    final childAssetModelId = this.childAssetModelId;
    final name = this.name;
    return {
      'childAssetModelId': childAssetModelId,
      'name': name,
    };
  }
}

/// Contains information about an asset model property.
class AssetModelProperty {
  /// The data type of the asset model property.
  final PropertyDataType dataType;

  /// The name of the asset model property.
  final String name;

  /// The property type (see <code>PropertyType</code>).
  final PropertyType type;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  final String? dataTypeSpec;

  /// The ID of the asset model property.
  final String? id;

  /// The unit of the asset model property, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  final String? unit;

  AssetModelProperty({
    required this.dataType,
    required this.name,
    required this.type,
    this.dataTypeSpec,
    this.id,
    this.unit,
  });
  factory AssetModelProperty.fromJson(Map<String, dynamic> json) {
    return AssetModelProperty(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      name: json['name'] as String,
      type: PropertyType.fromJson(json['type'] as Map<String, dynamic>),
      dataTypeSpec: json['dataTypeSpec'] as String?,
      id: json['id'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final type = this.type;
    final dataTypeSpec = this.dataTypeSpec;
    final id = this.id;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'name': name,
      'type': type,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (id != null) 'id': id,
      if (unit != null) 'unit': unit,
    };
  }
}

/// Contains an asset model property definition. This property definition is
/// applied to all assets created from the asset model.
class AssetModelPropertyDefinition {
  /// The data type of the property definition.
  ///
  /// If you specify <code>STRUCT</code>, you must also specify
  /// <code>dataTypeSpec</code> to identify the type of the structure for this
  /// property.
  final PropertyDataType dataType;

  /// The name of the property definition.
  final String name;

  /// The property definition type (see <code>PropertyType</code>). You can only
  /// specify one type in a property definition.
  final PropertyType type;

  /// The data type of the structure for this property. This parameter is required
  /// on properties that have the <code>STRUCT</code> data type.
  ///
  /// The options for this parameter depend on the type of the composite model in
  /// which you define this property. Use <code>AWS/ALARM_STATE</code> for alarm
  /// state in alarm composite models.
  final String? dataTypeSpec;

  /// The unit of the property definition, such as <code>Newtons</code> or
  /// <code>RPM</code>.
  final String? unit;

  AssetModelPropertyDefinition({
    required this.dataType,
    required this.name,
    required this.type,
    this.dataTypeSpec,
    this.unit,
  });
  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final name = this.name;
    final type = this.type;
    final dataTypeSpec = this.dataTypeSpec;
    final unit = this.unit;
    return {
      'dataType': dataType.toValue(),
      'name': name,
      'type': type,
      if (dataTypeSpec != null) 'dataTypeSpec': dataTypeSpec,
      if (unit != null) 'unit': unit,
    };
  }
}

enum AssetModelState {
  creating,
  active,
  updating,
  propagating,
  deleting,
  failed,
}

extension AssetModelStateValueExtension on AssetModelState {
  String toValue() {
    switch (this) {
      case AssetModelState.creating:
        return 'CREATING';
      case AssetModelState.active:
        return 'ACTIVE';
      case AssetModelState.updating:
        return 'UPDATING';
      case AssetModelState.propagating:
        return 'PROPAGATING';
      case AssetModelState.deleting:
        return 'DELETING';
      case AssetModelState.failed:
        return 'FAILED';
    }
  }
}

extension AssetModelStateFromString on String {
  AssetModelState toAssetModelState() {
    switch (this) {
      case 'CREATING':
        return AssetModelState.creating;
      case 'ACTIVE':
        return AssetModelState.active;
      case 'UPDATING':
        return AssetModelState.updating;
      case 'PROPAGATING':
        return AssetModelState.propagating;
      case 'DELETING':
        return AssetModelState.deleting;
      case 'FAILED':
        return AssetModelState.failed;
    }
    throw Exception('$this is not known in enum AssetModelState');
  }
}

/// Contains current status information for an asset model. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>AWS IoT SiteWise User Guide</i>.
class AssetModelStatus {
  /// The current state of the asset model.
  final AssetModelState state;

  /// Contains associated error information, if any.
  final ErrorDetails? error;

  AssetModelStatus({
    required this.state,
    this.error,
  });
  factory AssetModelStatus.fromJson(Map<String, dynamic> json) {
    return AssetModelStatus(
      state: (json['state'] as String).toAssetModelState(),
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains a summary of an asset model.
class AssetModelSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String arn;

  /// The date the asset model was created, in Unix epoch time.
  final DateTime creationDate;

  /// The asset model description.
  final String description;

  /// The ID of the asset model (used with AWS IoT SiteWise APIs).
  final String id;

  /// The date the asset model was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset model.
  final String name;

  /// The current status of the asset model.
  final AssetModelStatus status;

  AssetModelSummary({
    required this.arn,
    required this.creationDate,
    required this.description,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
  });
  factory AssetModelSummary.fromJson(Map<String, dynamic> json) {
    return AssetModelSummary(
      arn: json['arn'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      description: json['description'] as String,
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetModelStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }
}

/// Contains asset property information.
class AssetProperty {
  /// The data type of the asset property.
  final PropertyDataType dataType;

  /// The ID of the asset property.
  final String id;

  /// The name of the property.
  final String name;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  final String? alias;

  /// The data type of the structure for this property. This parameter exists on
  /// properties that have the <code>STRUCT</code> data type.
  final String? dataTypeSpec;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  final PropertyNotification? notification;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  final String? unit;

  AssetProperty({
    required this.dataType,
    required this.id,
    required this.name,
    this.alias,
    this.dataTypeSpec,
    this.notification,
    this.unit,
  });
  factory AssetProperty.fromJson(Map<String, dynamic> json) {
    return AssetProperty(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      id: json['id'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String?,
      dataTypeSpec: json['dataTypeSpec'] as String?,
      notification: json['notification'] != null
          ? PropertyNotification.fromJson(
              json['notification'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as String?,
    );
  }
}

/// Contains asset property value information.
class AssetPropertyValue {
  /// The timestamp of the asset property value.
  final TimeInNanos timestamp;

  /// The value of the asset property (see <code>Variant</code>).
  final Variant value;

  /// The quality of the asset property value.
  final Quality? quality;

  AssetPropertyValue({
    required this.timestamp,
    required this.value,
    this.quality,
  });
  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) {
    return AssetPropertyValue(
      timestamp:
          TimeInNanos.fromJson(json['timestamp'] as Map<String, dynamic>),
      value: Variant.fromJson(json['value'] as Map<String, dynamic>),
      quality: (json['quality'] as String?)?.toQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final value = this.value;
    final quality = this.quality;
    return {
      'timestamp': timestamp,
      'value': value,
      if (quality != null) 'quality': quality.toValue(),
    };
  }
}

/// Contains information about assets that are related to one another.
class AssetRelationshipSummary {
  /// The relationship type of the assets in this relationship. This value is one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>HIERARCHY</code> – The assets are related through an asset hierarchy.
  /// If you specify this relationship type, this asset relationship includes the
  /// <code>hierarchyInfo</code> object.
  /// </li>
  /// </ul>
  final AssetRelationshipType relationshipType;

  /// The assets that are related through an asset hierarchy.
  ///
  /// This object is present if the <code>relationshipType</code> is
  /// <code>HIERARCHY</code>.
  final AssetHierarchyInfo? hierarchyInfo;

  AssetRelationshipSummary({
    required this.relationshipType,
    this.hierarchyInfo,
  });
  factory AssetRelationshipSummary.fromJson(Map<String, dynamic> json) {
    return AssetRelationshipSummary(
      relationshipType:
          (json['relationshipType'] as String).toAssetRelationshipType(),
      hierarchyInfo: json['hierarchyInfo'] != null
          ? AssetHierarchyInfo.fromJson(
              json['hierarchyInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum AssetRelationshipType {
  hierarchy,
}

extension AssetRelationshipTypeValueExtension on AssetRelationshipType {
  String toValue() {
    switch (this) {
      case AssetRelationshipType.hierarchy:
        return 'HIERARCHY';
    }
  }
}

extension AssetRelationshipTypeFromString on String {
  AssetRelationshipType toAssetRelationshipType() {
    switch (this) {
      case 'HIERARCHY':
        return AssetRelationshipType.hierarchy;
    }
    throw Exception('$this is not known in enum AssetRelationshipType');
  }
}

enum AssetState {
  creating,
  active,
  updating,
  deleting,
  failed,
}

extension AssetStateValueExtension on AssetState {
  String toValue() {
    switch (this) {
      case AssetState.creating:
        return 'CREATING';
      case AssetState.active:
        return 'ACTIVE';
      case AssetState.updating:
        return 'UPDATING';
      case AssetState.deleting:
        return 'DELETING';
      case AssetState.failed:
        return 'FAILED';
    }
  }
}

extension AssetStateFromString on String {
  AssetState toAssetState() {
    switch (this) {
      case 'CREATING':
        return AssetState.creating;
      case 'ACTIVE':
        return AssetState.active;
      case 'UPDATING':
        return AssetState.updating;
      case 'DELETING':
        return AssetState.deleting;
      case 'FAILED':
        return AssetState.failed;
    }
    throw Exception('$this is not known in enum AssetState');
  }
}

/// Contains information about the current status of an asset. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-and-model-states.html">Asset
/// and model states</a> in the <i>AWS IoT SiteWise User Guide</i>.
class AssetStatus {
  /// The current status of the asset.
  final AssetState state;

  /// Contains associated error information, if any.
  final ErrorDetails? error;

  AssetStatus({
    required this.state,
    this.error,
  });
  factory AssetStatus.fromJson(Map<String, dynamic> json) {
    return AssetStatus(
      state: (json['state'] as String).toAssetState(),
      error: json['error'] != null
          ? ErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains a summary of an asset.
class AssetSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String arn;

  /// The ID of the asset model used to create this asset.
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset.
  final String name;

  /// The current status of the asset.
  final AssetStatus status;

  AssetSummary({
    required this.arn,
    required this.assetModelId,
    required this.creationDate,
    required this.hierarchies,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
  });
  factory AssetSummary.fromJson(Map<String, dynamic> json) {
    return AssetSummary(
      arn: json['arn'] as String,
      assetModelId: json['assetModelId'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      hierarchies: (json['hierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }
}

/// Contains a summary of an associated asset.
class AssociatedAssetsSummary {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String arn;

  /// The ID of the asset model used to create the asset.
  final String assetModelId;

  /// The date the asset was created, in Unix epoch time.
  final DateTime creationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> hierarchies;

  /// The ID of the asset.
  final String id;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The name of the asset.
  final String name;

  /// The current status of the asset.
  final AssetStatus status;

  AssociatedAssetsSummary({
    required this.arn,
    required this.assetModelId,
    required this.creationDate,
    required this.hierarchies,
    required this.id,
    required this.lastUpdateDate,
    required this.name,
    required this.status,
  });
  factory AssociatedAssetsSummary.fromJson(Map<String, dynamic> json) {
    return AssociatedAssetsSummary(
      arn: json['arn'] as String,
      assetModelId: json['assetModelId'] as String,
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      hierarchies: (json['hierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      name: json['name'] as String,
      status: AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }
}

/// Contains an asset attribute property. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#attributes">Attributes</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class Attribute {
  /// The default value of the asset model property attribute. All assets that you
  /// create from the asset model contain this attribute value. You can update an
  /// attribute's value after you create an asset. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/update-attribute-values.html">Updating
  /// attribute values</a> in the <i>AWS IoT SiteWise User Guide</i>.
  final String? defaultValue;

  Attribute({
    this.defaultValue,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      defaultValue: json['defaultValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    return {
      if (defaultValue != null) 'defaultValue': defaultValue,
    };
  }
}

enum AuthMode {
  iam,
  sso,
}

extension AuthModeValueExtension on AuthMode {
  String toValue() {
    switch (this) {
      case AuthMode.iam:
        return 'IAM';
      case AuthMode.sso:
        return 'SSO';
    }
  }
}

extension AuthModeFromString on String {
  AuthMode toAuthMode() {
    switch (this) {
      case 'IAM':
        return AuthMode.iam;
      case 'SSO':
        return AuthMode.sso;
    }
    throw Exception('$this is not known in enum AuthMode');
  }
}

class BatchAssociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  final List<AssetErrorDetails>? errors;

  BatchAssociateProjectAssetsResponse({
    this.errors,
  });
  factory BatchAssociateProjectAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateProjectAssetsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => AssetErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BatchDisassociateProjectAssetsResponse {
  /// A list of associated error information, if any.
  final List<AssetErrorDetails>? errors;

  BatchDisassociateProjectAssetsResponse({
    this.errors,
  });
  factory BatchDisassociateProjectAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateProjectAssetsResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => AssetErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains error information from updating a batch of asset property values.
class BatchPutAssetPropertyError {
  /// The error code.
  final BatchPutAssetPropertyValueErrorCode errorCode;

  /// The associated error message.
  final String errorMessage;

  /// A list of timestamps for each error, if any.
  final List<TimeInNanos> timestamps;

  BatchPutAssetPropertyError({
    required this.errorCode,
    required this.errorMessage,
    required this.timestamps,
  });
  factory BatchPutAssetPropertyError.fromJson(Map<String, dynamic> json) {
    return BatchPutAssetPropertyError(
      errorCode:
          (json['errorCode'] as String).toBatchPutAssetPropertyValueErrorCode(),
      errorMessage: json['errorMessage'] as String,
      timestamps: (json['timestamps'] as List)
          .whereNotNull()
          .map((e) => TimeInNanos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains error information for asset property value entries that are
/// associated with the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API.
class BatchPutAssetPropertyErrorEntry {
  /// The ID of the failed entry.
  final String entryId;

  /// The list of update property value errors.
  final List<BatchPutAssetPropertyError> errors;

  BatchPutAssetPropertyErrorEntry({
    required this.entryId,
    required this.errors,
  });
  factory BatchPutAssetPropertyErrorEntry.fromJson(Map<String, dynamic> json) {
    return BatchPutAssetPropertyErrorEntry(
      entryId: json['entryId'] as String,
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchPutAssetPropertyError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum BatchPutAssetPropertyValueErrorCode {
  resourceNotFoundException,
  invalidRequestException,
  internalFailureException,
  serviceUnavailableException,
  throttlingException,
  limitExceededException,
  conflictingOperationException,
  timestampOutOfRangeException,
  accessDeniedException,
}

extension BatchPutAssetPropertyValueErrorCodeValueExtension
    on BatchPutAssetPropertyValueErrorCode {
  String toValue() {
    switch (this) {
      case BatchPutAssetPropertyValueErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case BatchPutAssetPropertyValueErrorCode.invalidRequestException:
        return 'InvalidRequestException';
      case BatchPutAssetPropertyValueErrorCode.internalFailureException:
        return 'InternalFailureException';
      case BatchPutAssetPropertyValueErrorCode.serviceUnavailableException:
        return 'ServiceUnavailableException';
      case BatchPutAssetPropertyValueErrorCode.throttlingException:
        return 'ThrottlingException';
      case BatchPutAssetPropertyValueErrorCode.limitExceededException:
        return 'LimitExceededException';
      case BatchPutAssetPropertyValueErrorCode.conflictingOperationException:
        return 'ConflictingOperationException';
      case BatchPutAssetPropertyValueErrorCode.timestampOutOfRangeException:
        return 'TimestampOutOfRangeException';
      case BatchPutAssetPropertyValueErrorCode.accessDeniedException:
        return 'AccessDeniedException';
    }
  }
}

extension BatchPutAssetPropertyValueErrorCodeFromString on String {
  BatchPutAssetPropertyValueErrorCode toBatchPutAssetPropertyValueErrorCode() {
    switch (this) {
      case 'ResourceNotFoundException':
        return BatchPutAssetPropertyValueErrorCode.resourceNotFoundException;
      case 'InvalidRequestException':
        return BatchPutAssetPropertyValueErrorCode.invalidRequestException;
      case 'InternalFailureException':
        return BatchPutAssetPropertyValueErrorCode.internalFailureException;
      case 'ServiceUnavailableException':
        return BatchPutAssetPropertyValueErrorCode.serviceUnavailableException;
      case 'ThrottlingException':
        return BatchPutAssetPropertyValueErrorCode.throttlingException;
      case 'LimitExceededException':
        return BatchPutAssetPropertyValueErrorCode.limitExceededException;
      case 'ConflictingOperationException':
        return BatchPutAssetPropertyValueErrorCode
            .conflictingOperationException;
      case 'TimestampOutOfRangeException':
        return BatchPutAssetPropertyValueErrorCode.timestampOutOfRangeException;
      case 'AccessDeniedException':
        return BatchPutAssetPropertyValueErrorCode.accessDeniedException;
    }
    throw Exception(
        '$this is not known in enum BatchPutAssetPropertyValueErrorCode');
  }
}

class BatchPutAssetPropertyValueResponse {
  /// A list of the errors (if any) associated with the batch put request. Each
  /// error entry contains the <code>entryId</code> of the entry that failed.
  final List<BatchPutAssetPropertyErrorEntry> errorEntries;

  BatchPutAssetPropertyValueResponse({
    required this.errorEntries,
  });
  factory BatchPutAssetPropertyValueResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchPutAssetPropertyValueResponse(
      errorEntries: (json['errorEntries'] as List)
          .whereNotNull()
          .map((e) => BatchPutAssetPropertyErrorEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum CapabilitySyncStatus {
  inSync,
  outOfSync,
  syncFailed,
}

extension CapabilitySyncStatusValueExtension on CapabilitySyncStatus {
  String toValue() {
    switch (this) {
      case CapabilitySyncStatus.inSync:
        return 'IN_SYNC';
      case CapabilitySyncStatus.outOfSync:
        return 'OUT_OF_SYNC';
      case CapabilitySyncStatus.syncFailed:
        return 'SYNC_FAILED';
    }
  }
}

extension CapabilitySyncStatusFromString on String {
  CapabilitySyncStatus toCapabilitySyncStatus() {
    switch (this) {
      case 'IN_SYNC':
        return CapabilitySyncStatus.inSync;
      case 'OUT_OF_SYNC':
        return CapabilitySyncStatus.outOfSync;
      case 'SYNC_FAILED':
        return CapabilitySyncStatus.syncFailed;
    }
    throw Exception('$this is not known in enum CapabilitySyncStatus');
  }
}

/// Contains information about a composite model property on an asset.
class CompositeModelProperty {
  final Property assetProperty;

  /// The name of the property.
  final String name;

  /// The type of the composite model that defines this property.
  final String type;

  CompositeModelProperty({
    required this.assetProperty,
    required this.name,
    required this.type,
  });
  factory CompositeModelProperty.fromJson(Map<String, dynamic> json) {
    return CompositeModelProperty(
      assetProperty:
          Property.fromJson(json['assetProperty'] as Map<String, dynamic>),
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }
}

/// Contains the details of an AWS IoT SiteWise configuration error.
class ConfigurationErrorDetails {
  /// The error code.
  final ErrorCode code;

  /// The error message.
  final String message;

  ConfigurationErrorDetails({
    required this.code,
    required this.message,
  });
  factory ConfigurationErrorDetails.fromJson(Map<String, dynamic> json) {
    return ConfigurationErrorDetails(
      code: (json['code'] as String).toErrorCode(),
      message: json['message'] as String,
    );
  }
}

enum ConfigurationState {
  active,
  updateInProgress,
  updateFailed,
}

extension ConfigurationStateValueExtension on ConfigurationState {
  String toValue() {
    switch (this) {
      case ConfigurationState.active:
        return 'ACTIVE';
      case ConfigurationState.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case ConfigurationState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension ConfigurationStateFromString on String {
  ConfigurationState toConfigurationState() {
    switch (this) {
      case 'ACTIVE':
        return ConfigurationState.active;
      case 'UPDATE_IN_PROGRESS':
        return ConfigurationState.updateInProgress;
      case 'UPDATE_FAILED':
        return ConfigurationState.updateFailed;
    }
    throw Exception('$this is not known in enum ConfigurationState');
  }
}

/// Contains current status information for the configuration.
class ConfigurationStatus {
  /// The current state of the configuration.
  final ConfigurationState state;

  /// Contains associated error information, if any.
  final ConfigurationErrorDetails? error;

  ConfigurationStatus({
    required this.state,
    this.error,
  });
  factory ConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return ConfigurationStatus(
      state: (json['state'] as String).toConfigurationState(),
      error: json['error'] != null
          ? ConfigurationErrorDetails.fromJson(
              json['error'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  final String accessPolicyArn;

  /// The ID of the access policy.
  final String accessPolicyId;

  CreateAccessPolicyResponse({
    required this.accessPolicyArn,
    required this.accessPolicyId,
  });
  factory CreateAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessPolicyResponse(
      accessPolicyArn: json['accessPolicyArn'] as String,
      accessPolicyId: json['accessPolicyId'] as String,
    );
  }
}

class CreateAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String assetModelArn;

  /// The ID of the asset model. You can use this ID when you call other AWS IoT
  /// SiteWise APIs.
  final String assetModelId;

  /// The status of the asset model, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  CreateAssetModelResponse({
    required this.assetModelArn,
    required this.assetModelId,
    required this.assetModelStatus,
  });
  factory CreateAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetModelResponse(
      assetModelArn: json['assetModelArn'] as String,
      assetModelId: json['assetModelId'] as String,
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }
}

class CreateAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String assetArn;

  /// The ID of the asset. This ID uniquely identifies the asset within AWS IoT
  /// SiteWise and can be used with other AWS IoT SiteWise APIs.
  final String assetId;

  /// The status of the asset, which contains a state (<code>CREATING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  CreateAssetResponse({
    required this.assetArn,
    required this.assetId,
    required this.assetStatus,
  });
  factory CreateAssetResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssetResponse(
      assetArn: json['assetArn'] as String,
      assetId: json['assetId'] as String,
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }
}

class CreateDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  final String dashboardArn;

  /// The ID of the dashboard.
  final String dashboardId;

  CreateDashboardResponse({
    required this.dashboardArn,
    required this.dashboardId,
  });
  factory CreateDashboardResponse.fromJson(Map<String, dynamic> json) {
    return CreateDashboardResponse(
      dashboardArn: json['dashboardArn'] as String,
      dashboardId: json['dashboardId'] as String,
    );
  }
}

class CreateGatewayResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  final String gatewayArn;

  /// The ID of the gateway device. You can use this ID when you call other AWS
  /// IoT SiteWise APIs.
  final String gatewayId;

  CreateGatewayResponse({
    required this.gatewayArn,
    required this.gatewayId,
  });
  factory CreateGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateGatewayResponse(
      gatewayArn: json['gatewayArn'] as String,
      gatewayId: json['gatewayId'] as String,
    );
  }
}

class CreatePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  final String portalArn;

  /// The ID of the created portal.
  final String portalId;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  final String portalStartUrl;

  /// The status of the portal, which contains a state (<code>CREATING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  /// The associated AWS SSO application ID, if the portal uses AWS SSO.
  final String ssoApplicationId;

  CreatePortalResponse({
    required this.portalArn,
    required this.portalId,
    required this.portalStartUrl,
    required this.portalStatus,
    required this.ssoApplicationId,
  });
  factory CreatePortalResponse.fromJson(Map<String, dynamic> json) {
    return CreatePortalResponse(
      portalArn: json['portalArn'] as String,
      portalId: json['portalId'] as String,
      portalStartUrl: json['portalStartUrl'] as String,
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
      ssoApplicationId: json['ssoApplicationId'] as String,
    );
  }
}

class CreateProjectResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  final String projectArn;

  /// The ID of the project.
  final String projectId;

  CreateProjectResponse({
    required this.projectArn,
    required this.projectId,
  });
  factory CreateProjectResponse.fromJson(Map<String, dynamic> json) {
    return CreateProjectResponse(
      projectArn: json['projectArn'] as String,
      projectId: json['projectId'] as String,
    );
  }
}

/// Contains a dashboard summary.
class DashboardSummary {
  /// The ID of the dashboard.
  final String id;

  /// The name of the dashboard
  final String name;

  /// The date the dashboard was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The dashboard's description.
  final String? description;

  /// The date the dashboard was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  DashboardSummary({
    required this.id,
    required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });
  factory DashboardSummary.fromJson(Map<String, dynamic> json) {
    return DashboardSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }
}

class DeleteAccessPolicyResponse {
  DeleteAccessPolicyResponse();
  factory DeleteAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccessPolicyResponse();
  }
}

class DeleteAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  DeleteAssetModelResponse({
    required this.assetModelStatus,
  });
  factory DeleteAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAssetModelResponse(
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }
}

class DeleteAssetResponse {
  /// The status of the asset, which contains a state (<code>DELETING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  DeleteAssetResponse({
    required this.assetStatus,
  });
  factory DeleteAssetResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAssetResponse(
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }
}

class DeleteDashboardResponse {
  DeleteDashboardResponse();
  factory DeleteDashboardResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDashboardResponse();
  }
}

class DeletePortalResponse {
  /// The status of the portal, which contains a state (<code>DELETING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  DeletePortalResponse({
    required this.portalStatus,
  });
  factory DeletePortalResponse.fromJson(Map<String, dynamic> json) {
    return DeletePortalResponse(
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    );
  }
}

class DeleteProjectResponse {
  DeleteProjectResponse();
  factory DeleteProjectResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProjectResponse();
  }
}

class DescribeAccessPolicyResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the access policy, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:access-policy/${AccessPolicyId}</code>
  final String accessPolicyArn;

  /// The date the access policy was created, in Unix epoch time.
  final DateTime accessPolicyCreationDate;

  /// The ID of the access policy.
  final String accessPolicyId;

  /// The identity (AWS SSO user, AWS SSO group, or IAM user) to which this access
  /// policy applies.
  final Identity accessPolicyIdentity;

  /// The date the access policy was last updated, in Unix epoch time.
  final DateTime accessPolicyLastUpdateDate;

  /// The access policy permission. Note that a project <code>ADMINISTRATOR</code>
  /// is also known as a project owner.
  final Permission accessPolicyPermission;

  /// The AWS IoT SiteWise Monitor resource (portal or project) to which this
  /// access policy provides access.
  final Resource accessPolicyResource;

  DescribeAccessPolicyResponse({
    required this.accessPolicyArn,
    required this.accessPolicyCreationDate,
    required this.accessPolicyId,
    required this.accessPolicyIdentity,
    required this.accessPolicyLastUpdateDate,
    required this.accessPolicyPermission,
    required this.accessPolicyResource,
  });
  factory DescribeAccessPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAccessPolicyResponse(
      accessPolicyArn: json['accessPolicyArn'] as String,
      accessPolicyCreationDate: nonNullableTimeStampFromJson(
          json['accessPolicyCreationDate'] as Object),
      accessPolicyId: json['accessPolicyId'] as String,
      accessPolicyIdentity: Identity.fromJson(
          json['accessPolicyIdentity'] as Map<String, dynamic>),
      accessPolicyLastUpdateDate: nonNullableTimeStampFromJson(
          json['accessPolicyLastUpdateDate'] as Object),
      accessPolicyPermission:
          (json['accessPolicyPermission'] as String).toPermission(),
      accessPolicyResource: Resource.fromJson(
          json['accessPolicyResource'] as Map<String, dynamic>),
    );
  }
}

class DescribeAssetModelResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset model, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset-model/${AssetModelId}</code>
  final String assetModelArn;

  /// The date the asset model was created, in Unix epoch time.
  final DateTime assetModelCreationDate;

  /// The asset model's description.
  final String assetModelDescription;

  /// A list of asset model hierarchies that each contain a
  /// <code>childAssetModelId</code> and a <code>hierarchyId</code> (named
  /// <code>id</code>). A hierarchy specifies allowed parent/child asset
  /// relationships for an asset model.
  final List<AssetModelHierarchy> assetModelHierarchies;

  /// The ID of the asset model.
  final String assetModelId;

  /// The date the asset model was last updated, in Unix epoch time.
  final DateTime assetModelLastUpdateDate;

  /// The name of the asset model.
  final String assetModelName;

  /// The list of asset properties for the asset model.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetModelCompositeModels</code> object.
  final List<AssetModelProperty> assetModelProperties;

  /// The current status of the asset model, which contains a state and any error
  /// message.
  final AssetModelStatus assetModelStatus;

  /// The list of composite asset models for the asset model.
  final List<AssetModelCompositeModel>? assetModelCompositeModels;

  DescribeAssetModelResponse({
    required this.assetModelArn,
    required this.assetModelCreationDate,
    required this.assetModelDescription,
    required this.assetModelHierarchies,
    required this.assetModelId,
    required this.assetModelLastUpdateDate,
    required this.assetModelName,
    required this.assetModelProperties,
    required this.assetModelStatus,
    this.assetModelCompositeModels,
  });
  factory DescribeAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetModelResponse(
      assetModelArn: json['assetModelArn'] as String,
      assetModelCreationDate: nonNullableTimeStampFromJson(
          json['assetModelCreationDate'] as Object),
      assetModelDescription: json['assetModelDescription'] as String,
      assetModelHierarchies: (json['assetModelHierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetModelHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetModelId: json['assetModelId'] as String,
      assetModelLastUpdateDate: nonNullableTimeStampFromJson(
          json['assetModelLastUpdateDate'] as Object),
      assetModelName: json['assetModelName'] as String,
      assetModelProperties: (json['assetModelProperties'] as List)
          .whereNotNull()
          .map((e) => AssetModelProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
      assetModelCompositeModels: (json['assetModelCompositeModels'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssetModelCompositeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeAssetPropertyResponse {
  /// The ID of the asset.
  final String assetId;

  /// The ID of the asset model.
  final String assetModelId;

  /// The name of the asset.
  final String assetName;

  /// The asset property's definition, alias, and notification state.
  ///
  /// This response includes this object for normal asset properties. If you
  /// describe an asset property in a composite model, this response includes the
  /// asset property information in <code>compositeModel</code>.
  final Property? assetProperty;

  /// The composite asset model that declares this asset property, if this asset
  /// property exists in a composite model.
  final CompositeModelProperty? compositeModel;

  DescribeAssetPropertyResponse({
    required this.assetId,
    required this.assetModelId,
    required this.assetName,
    this.assetProperty,
    this.compositeModel,
  });
  factory DescribeAssetPropertyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetPropertyResponse(
      assetId: json['assetId'] as String,
      assetModelId: json['assetModelId'] as String,
      assetName: json['assetName'] as String,
      assetProperty: json['assetProperty'] != null
          ? Property.fromJson(json['assetProperty'] as Map<String, dynamic>)
          : null,
      compositeModel: json['compositeModel'] != null
          ? CompositeModelProperty.fromJson(
              json['compositeModel'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeAssetResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the asset, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:asset/${AssetId}</code>
  final String assetArn;

  /// The date the asset was created, in Unix epoch time.
  final DateTime assetCreationDate;

  /// A list of asset hierarchies that each contain a <code>hierarchyId</code>. A
  /// hierarchy specifies allowed parent/child asset relationships.
  final List<AssetHierarchy> assetHierarchies;

  /// The ID of the asset.
  final String assetId;

  /// The date the asset was last updated, in Unix epoch time.
  final DateTime assetLastUpdateDate;

  /// The ID of the asset model that was used to create the asset.
  final String assetModelId;

  /// The name of the asset.
  final String assetName;

  /// The list of asset properties for the asset.
  ///
  /// This object doesn't include properties that you define in composite models.
  /// You can find composite model properties in the
  /// <code>assetCompositeModels</code> object.
  final List<AssetProperty> assetProperties;

  /// The current status of the asset, which contains a state and any error
  /// message.
  final AssetStatus assetStatus;

  /// The composite models for the asset.
  final List<AssetCompositeModel>? assetCompositeModels;

  DescribeAssetResponse({
    required this.assetArn,
    required this.assetCreationDate,
    required this.assetHierarchies,
    required this.assetId,
    required this.assetLastUpdateDate,
    required this.assetModelId,
    required this.assetName,
    required this.assetProperties,
    required this.assetStatus,
    this.assetCompositeModels,
  });
  factory DescribeAssetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAssetResponse(
      assetArn: json['assetArn'] as String,
      assetCreationDate:
          nonNullableTimeStampFromJson(json['assetCreationDate'] as Object),
      assetHierarchies: (json['assetHierarchies'] as List)
          .whereNotNull()
          .map((e) => AssetHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetId: json['assetId'] as String,
      assetLastUpdateDate:
          nonNullableTimeStampFromJson(json['assetLastUpdateDate'] as Object),
      assetModelId: json['assetModelId'] as String,
      assetName: json['assetName'] as String,
      assetProperties: (json['assetProperties'] as List)
          .whereNotNull()
          .map((e) => AssetProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
      assetCompositeModels: (json['assetCompositeModels'] as List?)
          ?.whereNotNull()
          .map((e) => AssetCompositeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DescribeDashboardResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the dashboard, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:dashboard/${DashboardId}</code>
  final String dashboardArn;

  /// The date the dashboard was created, in Unix epoch time.
  final DateTime dashboardCreationDate;

  /// The dashboard's definition JSON literal. For detailed information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/create-dashboards-using-aws-cli.html">Creating
  /// dashboards (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  final String dashboardDefinition;

  /// The ID of the dashboard.
  final String dashboardId;

  /// The date the dashboard was last updated, in Unix epoch time.
  final DateTime dashboardLastUpdateDate;

  /// The name of the dashboard.
  final String dashboardName;

  /// The ID of the project that the dashboard is in.
  final String projectId;

  /// The dashboard's description.
  final String? dashboardDescription;

  DescribeDashboardResponse({
    required this.dashboardArn,
    required this.dashboardCreationDate,
    required this.dashboardDefinition,
    required this.dashboardId,
    required this.dashboardLastUpdateDate,
    required this.dashboardName,
    required this.projectId,
    this.dashboardDescription,
  });
  factory DescribeDashboardResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDashboardResponse(
      dashboardArn: json['dashboardArn'] as String,
      dashboardCreationDate:
          nonNullableTimeStampFromJson(json['dashboardCreationDate'] as Object),
      dashboardDefinition: json['dashboardDefinition'] as String,
      dashboardId: json['dashboardId'] as String,
      dashboardLastUpdateDate: nonNullableTimeStampFromJson(
          json['dashboardLastUpdateDate'] as Object),
      dashboardName: json['dashboardName'] as String,
      projectId: json['projectId'] as String,
      dashboardDescription: json['dashboardDescription'] as String?,
    );
  }
}

class DescribeDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there's an error, it also contains the
  /// <code>ErrorDetails</code>.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The key ARN of the customer managed customer master key (CMK) used for AWS
  /// KMS encryption if you use <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  DescribeDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });
  factory DescribeDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }
}

class DescribeGatewayCapabilityConfigurationResponse {
  /// The JSON document that defines the gateway capability's configuration. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/configure-sources.html#configure-source-cli">Configuring
  /// data sources (CLI)</a> in the <i>AWS IoT SiteWise User Guide</i>.
  final String capabilityConfiguration;

  /// The namespace of the gateway capability.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  final CapabilitySyncStatus capabilitySyncStatus;

  /// The ID of the gateway that defines the capability configuration.
  final String gatewayId;

  DescribeGatewayCapabilityConfigurationResponse({
    required this.capabilityConfiguration,
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
    required this.gatewayId,
  });
  factory DescribeGatewayCapabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeGatewayCapabilityConfigurationResponse(
      capabilityConfiguration: json['capabilityConfiguration'] as String,
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
      gatewayId: json['gatewayId'] as String,
    );
  }
}

class DescribeGatewayResponse {
  /// The date the gateway was created, in Unix epoch time.
  final DateTime creationDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the gateway, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:gateway/${GatewayId}</code>
  final String gatewayArn;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  final List<GatewayCapabilitySummary> gatewayCapabilitySummaries;

  /// The ID of the gateway device.
  final String gatewayId;

  /// The name of the gateway.
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// The gateway's platform.
  final GatewayPlatform? gatewayPlatform;

  DescribeGatewayResponse({
    required this.creationDate,
    required this.gatewayArn,
    required this.gatewayCapabilitySummaries,
    required this.gatewayId,
    required this.gatewayName,
    required this.lastUpdateDate,
    this.gatewayPlatform,
  });
  factory DescribeGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGatewayResponse(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      gatewayArn: json['gatewayArn'] as String,
      gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List)
          .whereNotNull()
          .map((e) =>
              GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayId: json['gatewayId'] as String,
      gatewayName: json['gatewayName'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      gatewayPlatform: json['gatewayPlatform'] != null
          ? GatewayPlatform.fromJson(
              json['gatewayPlatform'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeLoggingOptionsResponse {
  /// The current logging options.
  final LoggingOptions loggingOptions;

  DescribeLoggingOptionsResponse({
    required this.loggingOptions,
  });
  factory DescribeLoggingOptionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLoggingOptionsResponse(
      loggingOptions: LoggingOptions.fromJson(
          json['loggingOptions'] as Map<String, dynamic>),
    );
  }
}

class DescribePortalResponse {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the portal, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:portal/${PortalId}</code>
  final String portalArn;

  /// The AWS SSO application generated client ID (used with AWS SSO APIs). AWS
  /// IoT SiteWise includes <code>portalClientId</code> for only portals that use
  /// AWS SSO to authenticate users.
  final String portalClientId;

  /// The AWS administrator's contact email address.
  final String portalContactEmail;

  /// The date the portal was created, in Unix epoch time.
  final DateTime portalCreationDate;

  /// The ID of the portal.
  final String portalId;

  /// The date the portal was last updated, in Unix epoch time.
  final DateTime portalLastUpdateDate;

  /// The name of the portal.
  final String portalName;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  final String portalStartUrl;

  /// The current status of the portal, which contains a state and any error
  /// message.
  final PortalStatus portalStatus;

  /// The service to use to authenticate users to the portal.
  final AuthMode? portalAuthMode;

  /// The portal's description.
  final String? portalDescription;

  /// The portal's logo image, which is available at a URL.
  final ImageLocation? portalLogoImageLocation;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  final String? roleArn;

  DescribePortalResponse({
    required this.portalArn,
    required this.portalClientId,
    required this.portalContactEmail,
    required this.portalCreationDate,
    required this.portalId,
    required this.portalLastUpdateDate,
    required this.portalName,
    required this.portalStartUrl,
    required this.portalStatus,
    this.portalAuthMode,
    this.portalDescription,
    this.portalLogoImageLocation,
    this.roleArn,
  });
  factory DescribePortalResponse.fromJson(Map<String, dynamic> json) {
    return DescribePortalResponse(
      portalArn: json['portalArn'] as String,
      portalClientId: json['portalClientId'] as String,
      portalContactEmail: json['portalContactEmail'] as String,
      portalCreationDate:
          nonNullableTimeStampFromJson(json['portalCreationDate'] as Object),
      portalId: json['portalId'] as String,
      portalLastUpdateDate:
          nonNullableTimeStampFromJson(json['portalLastUpdateDate'] as Object),
      portalName: json['portalName'] as String,
      portalStartUrl: json['portalStartUrl'] as String,
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
      portalAuthMode: (json['portalAuthMode'] as String?)?.toAuthMode(),
      portalDescription: json['portalDescription'] as String?,
      portalLogoImageLocation: json['portalLogoImageLocation'] != null
          ? ImageLocation.fromJson(
              json['portalLogoImageLocation'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
    );
  }
}

class DescribeProjectResponse {
  /// The ID of the portal that the project is in.
  final String portalId;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the project, which has the following format.
  ///
  /// <code>arn:${Partition}:iotsitewise:${Region}:${Account}:project/${ProjectId}</code>
  final String projectArn;

  /// The date the project was created, in Unix epoch time.
  final DateTime projectCreationDate;

  /// The ID of the project.
  final String projectId;

  /// The date the project was last updated, in Unix epoch time.
  final DateTime projectLastUpdateDate;

  /// The name of the project.
  final String projectName;

  /// The project's description.
  final String? projectDescription;

  DescribeProjectResponse({
    required this.portalId,
    required this.projectArn,
    required this.projectCreationDate,
    required this.projectId,
    required this.projectLastUpdateDate,
    required this.projectName,
    this.projectDescription,
  });
  factory DescribeProjectResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProjectResponse(
      portalId: json['portalId'] as String,
      projectArn: json['projectArn'] as String,
      projectCreationDate:
          nonNullableTimeStampFromJson(json['projectCreationDate'] as Object),
      projectId: json['projectId'] as String,
      projectLastUpdateDate:
          nonNullableTimeStampFromJson(json['projectLastUpdateDate'] as Object),
      projectName: json['projectName'] as String,
      projectDescription: json['projectDescription'] as String?,
    );
  }
}

enum EncryptionType {
  sitewiseDefaultEncryption,
  kmsBasedEncryption,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.sitewiseDefaultEncryption:
        return 'SITEWISE_DEFAULT_ENCRYPTION';
      case EncryptionType.kmsBasedEncryption:
        return 'KMS_BASED_ENCRYPTION';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'SITEWISE_DEFAULT_ENCRYPTION':
        return EncryptionType.sitewiseDefaultEncryption;
      case 'KMS_BASED_ENCRYPTION':
        return EncryptionType.kmsBasedEncryption;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

enum ErrorCode {
  validationError,
  internalFailure,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case ErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'VALIDATION_ERROR':
        return ErrorCode.validationError;
      case 'INTERNAL_FAILURE':
        return ErrorCode.internalFailure;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Contains the details of an AWS IoT SiteWise error.
class ErrorDetails {
  /// The error code.
  final ErrorCode code;

  /// The error message.
  final String message;

  ErrorDetails({
    required this.code,
    required this.message,
  });
  factory ErrorDetails.fromJson(Map<String, dynamic> json) {
    return ErrorDetails(
      code: (json['code'] as String).toErrorCode(),
      message: json['message'] as String,
    );
  }
}

/// Contains expression variable information.
class ExpressionVariable {
  /// The friendly name of the variable to be used in the expression.
  final String name;

  /// The variable that identifies an asset property from which to use values.
  final VariableValue value;

  ExpressionVariable({
    required this.name,
    required this.value,
  });
  factory ExpressionVariable.fromJson(Map<String, dynamic> json) {
    return ExpressionVariable(
      name: json['name'] as String,
      value: VariableValue.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Contains a summary of a gateway capability configuration.
class GatewayCapabilitySummary {
  /// The namespace of the capability configuration. For example, if you configure
  /// OPC-UA sources from the AWS IoT SiteWise console, your OPC-UA capability
  /// configuration has the namespace
  /// <code>iotsitewise:opcuacollector:version</code>, where <code>version</code>
  /// is a number such as <code>1</code>.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  final CapabilitySyncStatus capabilitySyncStatus;

  GatewayCapabilitySummary({
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
  });
  factory GatewayCapabilitySummary.fromJson(Map<String, dynamic> json) {
    return GatewayCapabilitySummary(
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
    );
  }
}

/// Contains a gateway's platform information.
class GatewayPlatform {
  /// A gateway that runs on AWS IoT Greengrass.
  final Greengrass greengrass;

  GatewayPlatform({
    required this.greengrass,
  });
  factory GatewayPlatform.fromJson(Map<String, dynamic> json) {
    return GatewayPlatform(
      greengrass:
          Greengrass.fromJson(json['greengrass'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final greengrass = this.greengrass;
    return {
      'greengrass': greengrass,
    };
  }
}

/// Contains a summary of a gateway.
class GatewaySummary {
  /// The date the gateway was created, in Unix epoch time.
  final DateTime creationDate;

  /// The ID of the gateway device.
  final String gatewayId;

  /// The name of the asset.
  final String gatewayName;

  /// The date the gateway was last updated, in Unix epoch time.
  final DateTime lastUpdateDate;

  /// A list of gateway capability summaries that each contain a namespace and
  /// status. Each gateway capability defines data sources for the gateway. To
  /// retrieve a capability configuration's definition, use <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_DescribeGatewayCapabilityConfiguration.html">DescribeGatewayCapabilityConfiguration</a>.
  final List<GatewayCapabilitySummary>? gatewayCapabilitySummaries;

  GatewaySummary({
    required this.creationDate,
    required this.gatewayId,
    required this.gatewayName,
    required this.lastUpdateDate,
    this.gatewayCapabilitySummaries,
  });
  factory GatewaySummary.fromJson(Map<String, dynamic> json) {
    return GatewaySummary(
      creationDate:
          nonNullableTimeStampFromJson(json['creationDate'] as Object),
      gatewayId: json['gatewayId'] as String,
      gatewayName: json['gatewayName'] as String,
      lastUpdateDate:
          nonNullableTimeStampFromJson(json['lastUpdateDate'] as Object),
      gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetAssetPropertyAggregatesResponse {
  /// The requested aggregated values.
  final List<AggregatedValue> aggregatedValues;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  GetAssetPropertyAggregatesResponse({
    required this.aggregatedValues,
    this.nextToken,
  });
  factory GetAssetPropertyAggregatesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAssetPropertyAggregatesResponse(
      aggregatedValues: (json['aggregatedValues'] as List)
          .whereNotNull()
          .map((e) => AggregatedValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetAssetPropertyValueHistoryResponse {
  /// The asset property's value history.
  final List<AssetPropertyValue> assetPropertyValueHistory;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  GetAssetPropertyValueHistoryResponse({
    required this.assetPropertyValueHistory,
    this.nextToken,
  });
  factory GetAssetPropertyValueHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAssetPropertyValueHistoryResponse(
      assetPropertyValueHistory: (json['assetPropertyValueHistory'] as List)
          .whereNotNull()
          .map((e) => AssetPropertyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class GetAssetPropertyValueResponse {
  /// The current asset property value.
  final AssetPropertyValue? propertyValue;

  GetAssetPropertyValueResponse({
    this.propertyValue,
  });
  factory GetAssetPropertyValueResponse.fromJson(Map<String, dynamic> json) {
    return GetAssetPropertyValueResponse(
      propertyValue: json['propertyValue'] != null
          ? AssetPropertyValue.fromJson(
              json['propertyValue'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details for a gateway that runs on AWS IoT Greengrass. To create a
/// gateway that runs on AWS IoT Greengrass, you must add the IoT SiteWise
/// connector to a Greengrass group and deploy it. Your Greengrass group must
/// also have permissions to upload data to AWS IoT SiteWise. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/gateway-connector.html">Ingesting
/// data using a gateway</a> in the <i>AWS IoT SiteWise User Guide</i>.
class Greengrass {
  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the Greengrass group. For more information about how to find a group's
  /// ARN, see <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/listgroups-get.html">ListGroups</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/greengrass/latest/apireference/getgroup-get.html">GetGroup</a>
  /// in the <i>AWS IoT Greengrass API Reference</i>.
  final String groupArn;

  Greengrass({
    required this.groupArn,
  });
  factory Greengrass.fromJson(Map<String, dynamic> json) {
    return Greengrass(
      groupArn: json['groupArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupArn = this.groupArn;
    return {
      'groupArn': groupArn,
    };
  }
}

/// Contains information for a group identity in an access policy.
class GroupIdentity {
  /// The AWS SSO ID of the group.
  final String id;

  GroupIdentity({
    required this.id,
  });
  factory GroupIdentity.fromJson(Map<String, dynamic> json) {
    return GroupIdentity(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Contains information about an AWS Identity and Access Management (IAM) user.
class IAMUserIdentity {
  /// The ARN of the IAM user. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html">IAM
  /// ARNs</a> in the <i>IAM User Guide</i>.
  /// <note>
  /// If you delete the IAM user, access policies that contain this identity
  /// include an empty <code>arn</code>. You can delete the access policy for the
  /// IAM user that no longer exists.
  /// </note>
  final String arn;

  IAMUserIdentity({
    required this.arn,
  });
  factory IAMUserIdentity.fromJson(Map<String, dynamic> json) {
    return IAMUserIdentity(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// Contains an identity that can access an AWS IoT SiteWise Monitor resource.
/// <note>
/// Currently, you can't use AWS APIs to retrieve AWS SSO identity IDs. You can
/// find the AWS SSO identity IDs in the URL of user and group pages in the <a
/// href="https://console.aws.amazon.com/singlesignon">AWS SSO console</a>.
/// </note>
class Identity {
  /// An AWS SSO group identity.
  final GroupIdentity? group;

  /// An IAM user identity.
  final IAMUserIdentity? iamUser;

  /// An AWS SSO user identity.
  final UserIdentity? user;

  Identity({
    this.group,
    this.iamUser,
    this.user,
  });
  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      group: json['group'] != null
          ? GroupIdentity.fromJson(json['group'] as Map<String, dynamic>)
          : null,
      iamUser: json['iamUser'] != null
          ? IAMUserIdentity.fromJson(json['iamUser'] as Map<String, dynamic>)
          : null,
      user: json['user'] != null
          ? UserIdentity.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final iamUser = this.iamUser;
    final user = this.user;
    return {
      if (group != null) 'group': group,
      if (iamUser != null) 'iamUser': iamUser,
      if (user != null) 'user': user,
    };
  }
}

enum IdentityType {
  user,
  group,
  iam,
}

extension IdentityTypeValueExtension on IdentityType {
  String toValue() {
    switch (this) {
      case IdentityType.user:
        return 'USER';
      case IdentityType.group:
        return 'GROUP';
      case IdentityType.iam:
        return 'IAM';
    }
  }
}

extension IdentityTypeFromString on String {
  IdentityType toIdentityType() {
    switch (this) {
      case 'USER':
        return IdentityType.user;
      case 'GROUP':
        return IdentityType.group;
      case 'IAM':
        return IdentityType.iam;
    }
    throw Exception('$this is not known in enum IdentityType');
  }
}

/// Contains an image that is one of the following:
///
/// <ul>
/// <li>
/// An image file. Choose this option to upload a new image.
/// </li>
/// <li>
/// The ID of an existing image. Choose this option to keep an existing image.
/// </li>
/// </ul>
class Image {
  final ImageFile? file;

  /// The ID of an existing image. Specify this parameter to keep an existing
  /// image.
  final String? id;

  Image({
    this.file,
    this.id,
  });
  Map<String, dynamic> toJson() {
    final file = this.file;
    final id = this.id;
    return {
      if (file != null) 'file': file,
      if (id != null) 'id': id,
    };
  }
}

/// Contains an image file.
class ImageFile {
  /// The image file contents, represented as a base64-encoded string. The file
  /// size must be less than 1 MB.
  final Uint8List data;

  /// The file type of the image.
  final ImageFileType type;

  ImageFile({
    required this.data,
    required this.type,
  });
  Map<String, dynamic> toJson() {
    final data = this.data;
    final type = this.type;
    return {
      'data': base64Encode(data),
      'type': type.toValue(),
    };
  }
}

enum ImageFileType {
  png,
}

extension ImageFileTypeValueExtension on ImageFileType {
  String toValue() {
    switch (this) {
      case ImageFileType.png:
        return 'PNG';
    }
  }
}

extension ImageFileTypeFromString on String {
  ImageFileType toImageFileType() {
    switch (this) {
      case 'PNG':
        return ImageFileType.png;
    }
    throw Exception('$this is not known in enum ImageFileType');
  }
}

/// Contains an image that is uploaded to AWS IoT SiteWise and available at a
/// URL.
class ImageLocation {
  /// The ID of the image.
  final String id;

  /// The URL where the image is available. The URL is valid for 15 minutes so
  /// that you can view and download the image
  final String url;

  ImageLocation({
    required this.id,
    required this.url,
  });
  factory ImageLocation.fromJson(Map<String, dynamic> json) {
    return ImageLocation(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }
}

class ListAccessPoliciesResponse {
  /// A list that summarizes each access policy.
  final List<AccessPolicySummary> accessPolicySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAccessPoliciesResponse({
    required this.accessPolicySummaries,
    this.nextToken,
  });
  factory ListAccessPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPoliciesResponse(
      accessPolicySummaries: (json['accessPolicySummaries'] as List)
          .whereNotNull()
          .map((e) => AccessPolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAssetModelsResponse {
  /// A list that summarizes each asset model.
  final List<AssetModelSummary> assetModelSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetModelsResponse({
    required this.assetModelSummaries,
    this.nextToken,
  });
  factory ListAssetModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetModelsResponse(
      assetModelSummaries: (json['assetModelSummaries'] as List)
          .whereNotNull()
          .map((e) => AssetModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAssetRelationshipsResponse {
  /// A list that summarizes each asset relationship.
  final List<AssetRelationshipSummary> assetRelationshipSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetRelationshipsResponse({
    required this.assetRelationshipSummaries,
    this.nextToken,
  });
  factory ListAssetRelationshipsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetRelationshipsResponse(
      assetRelationshipSummaries: (json['assetRelationshipSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AssetRelationshipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

enum ListAssetsFilter {
  all,
  topLevel,
}

extension ListAssetsFilterValueExtension on ListAssetsFilter {
  String toValue() {
    switch (this) {
      case ListAssetsFilter.all:
        return 'ALL';
      case ListAssetsFilter.topLevel:
        return 'TOP_LEVEL';
    }
  }
}

extension ListAssetsFilterFromString on String {
  ListAssetsFilter toListAssetsFilter() {
    switch (this) {
      case 'ALL':
        return ListAssetsFilter.all;
      case 'TOP_LEVEL':
        return ListAssetsFilter.topLevel;
    }
    throw Exception('$this is not known in enum ListAssetsFilter');
  }
}

class ListAssetsResponse {
  /// A list that summarizes each asset.
  final List<AssetSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssetsResponse({
    required this.assetSummaries,
    this.nextToken,
  });
  factory ListAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssetsResponse(
      assetSummaries: (json['assetSummaries'] as List)
          .whereNotNull()
          .map((e) => AssetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListAssociatedAssetsResponse {
  /// A list that summarizes the associated assets.
  final List<AssociatedAssetsSummary> assetSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListAssociatedAssetsResponse({
    required this.assetSummaries,
    this.nextToken,
  });
  factory ListAssociatedAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssociatedAssetsResponse(
      assetSummaries: (json['assetSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              AssociatedAssetsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListDashboardsResponse {
  /// A list that summarizes each dashboard in the project.
  final List<DashboardSummary> dashboardSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListDashboardsResponse({
    required this.dashboardSummaries,
    this.nextToken,
  });
  factory ListDashboardsResponse.fromJson(Map<String, dynamic> json) {
    return ListDashboardsResponse(
      dashboardSummaries: (json['dashboardSummaries'] as List)
          .whereNotNull()
          .map((e) => DashboardSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListGatewaysResponse {
  /// A list that summarizes each gateway.
  final List<GatewaySummary> gatewaySummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListGatewaysResponse({
    required this.gatewaySummaries,
    this.nextToken,
  });
  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewaysResponse(
      gatewaySummaries: (json['gatewaySummaries'] as List)
          .whereNotNull()
          .map((e) => GatewaySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListPortalsResponse {
  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  /// A list that summarizes each portal.
  final List<PortalSummary>? portalSummaries;

  ListPortalsResponse({
    this.nextToken,
    this.portalSummaries,
  });
  factory ListPortalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPortalsResponse(
      nextToken: json['nextToken'] as String?,
      portalSummaries: (json['portalSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => PortalSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListProjectAssetsResponse {
  /// A list that contains the IDs of each asset associated with the project.
  final List<String> assetIds;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListProjectAssetsResponse({
    required this.assetIds,
    this.nextToken,
  });
  factory ListProjectAssetsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectAssetsResponse(
      assetIds: (json['assetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListProjectsResponse {
  /// A list that summarizes each project in the portal.
  final List<ProjectSummary> projectSummaries;

  /// The token for the next set of results, or null if there are no additional
  /// results.
  final String? nextToken;

  ListProjectsResponse({
    required this.projectSummaries,
    this.nextToken,
  });
  factory ListProjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProjectsResponse(
      projectSummaries: (json['projectSummaries'] as List)
          .whereNotNull()
          .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// The list of key-value pairs that contain metadata for the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/tag-resources.html">Tagging
  /// your AWS IoT SiteWise resources</a> in the <i>AWS IoT SiteWise User
  /// Guide</i>.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum LoggingLevel {
  error,
  info,
  off,
}

extension LoggingLevelValueExtension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.error:
        return 'ERROR';
      case LoggingLevel.info:
        return 'INFO';
      case LoggingLevel.off:
        return 'OFF';
    }
  }
}

extension LoggingLevelFromString on String {
  LoggingLevel toLoggingLevel() {
    switch (this) {
      case 'ERROR':
        return LoggingLevel.error;
      case 'INFO':
        return LoggingLevel.info;
      case 'OFF':
        return LoggingLevel.off;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// Contains logging options.
class LoggingOptions {
  /// The AWS IoT SiteWise logging verbosity level.
  final LoggingLevel level;

  LoggingOptions({
    required this.level,
  });
  factory LoggingOptions.fromJson(Map<String, dynamic> json) {
    return LoggingOptions(
      level: (json['level'] as String).toLoggingLevel(),
    );
  }

  Map<String, dynamic> toJson() {
    final level = this.level;
    return {
      'level': level.toValue(),
    };
  }
}

/// Contains an asset measurement property. This structure is empty. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#measurements">Measurements</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class Measurement {
  Measurement();
  factory Measurement.fromJson(Map<String, dynamic> _) {
    return Measurement();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains an asset metric property. With metrics, you can calculate aggregate
/// functions, such as an average, maximum, or minimum, as specified through an
/// expression. A metric maps several values to a single value (such as a sum).
///
/// The maximum number of dependent/cascading variables used in any one metric
/// calculation is 10. Therefore, a <i>root</i> metric can have up to 10
/// cascading metrics in its computational dependency tree. Additionally, a
/// metric can only have a data type of <code>DOUBLE</code> and consume
/// properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#metrics">Metrics</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class Metric {
  /// The mathematical expression that defines the metric aggregation function.
  /// You can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  final String expression;

  /// The list of variables used in the expression.
  final List<ExpressionVariable> variables;

  /// The window (time interval) over which AWS IoT SiteWise computes the metric's
  /// aggregation expression. AWS IoT SiteWise computes one data point per
  /// <code>window</code>.
  final MetricWindow window;

  Metric({
    required this.expression,
    required this.variables,
    required this.window,
  });
  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      expression: json['expression'] as String,
      variables: (json['variables'] as List)
          .whereNotNull()
          .map((e) => ExpressionVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      window: MetricWindow.fromJson(json['window'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final variables = this.variables;
    final window = this.window;
    return {
      'expression': expression,
      'variables': variables,
      'window': window,
    };
  }
}

/// Contains a time interval window used for data aggregate computations (for
/// example, average, sum, count, and so on).
class MetricWindow {
  /// The tumbling time interval window.
  final TumblingWindow? tumbling;

  MetricWindow({
    this.tumbling,
  });
  factory MetricWindow.fromJson(Map<String, dynamic> json) {
    return MetricWindow(
      tumbling: json['tumbling'] != null
          ? TumblingWindow.fromJson(json['tumbling'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tumbling = this.tumbling;
    return {
      if (tumbling != null) 'tumbling': tumbling,
    };
  }
}

enum MonitorErrorCode {
  internalFailure,
  validationError,
  limitExceeded,
}

extension MonitorErrorCodeValueExtension on MonitorErrorCode {
  String toValue() {
    switch (this) {
      case MonitorErrorCode.internalFailure:
        return 'INTERNAL_FAILURE';
      case MonitorErrorCode.validationError:
        return 'VALIDATION_ERROR';
      case MonitorErrorCode.limitExceeded:
        return 'LIMIT_EXCEEDED';
    }
  }
}

extension MonitorErrorCodeFromString on String {
  MonitorErrorCode toMonitorErrorCode() {
    switch (this) {
      case 'INTERNAL_FAILURE':
        return MonitorErrorCode.internalFailure;
      case 'VALIDATION_ERROR':
        return MonitorErrorCode.validationError;
      case 'LIMIT_EXCEEDED':
        return MonitorErrorCode.limitExceeded;
    }
    throw Exception('$this is not known in enum MonitorErrorCode');
  }
}

/// Contains AWS IoT SiteWise Monitor error details.
class MonitorErrorDetails {
  /// The error code.
  final MonitorErrorCode? code;

  /// The error message.
  final String? message;

  MonitorErrorDetails({
    this.code,
    this.message,
  });
  factory MonitorErrorDetails.fromJson(Map<String, dynamic> json) {
    return MonitorErrorDetails(
      code: (json['code'] as String?)?.toMonitorErrorCode(),
      message: json['message'] as String?,
    );
  }
}

enum Permission {
  administrator,
  viewer,
}

extension PermissionValueExtension on Permission {
  String toValue() {
    switch (this) {
      case Permission.administrator:
        return 'ADMINISTRATOR';
      case Permission.viewer:
        return 'VIEWER';
    }
  }
}

extension PermissionFromString on String {
  Permission toPermission() {
    switch (this) {
      case 'ADMINISTRATOR':
        return Permission.administrator;
      case 'VIEWER':
        return Permission.viewer;
    }
    throw Exception('$this is not known in enum Permission');
  }
}

/// Identifies an AWS IoT SiteWise Monitor portal.
class PortalResource {
  /// The ID of the portal.
  final String id;

  PortalResource({
    required this.id,
  });
  factory PortalResource.fromJson(Map<String, dynamic> json) {
    return PortalResource(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

enum PortalState {
  creating,
  updating,
  deleting,
  active,
  failed,
}

extension PortalStateValueExtension on PortalState {
  String toValue() {
    switch (this) {
      case PortalState.creating:
        return 'CREATING';
      case PortalState.updating:
        return 'UPDATING';
      case PortalState.deleting:
        return 'DELETING';
      case PortalState.active:
        return 'ACTIVE';
      case PortalState.failed:
        return 'FAILED';
    }
  }
}

extension PortalStateFromString on String {
  PortalState toPortalState() {
    switch (this) {
      case 'CREATING':
        return PortalState.creating;
      case 'UPDATING':
        return PortalState.updating;
      case 'DELETING':
        return PortalState.deleting;
      case 'ACTIVE':
        return PortalState.active;
      case 'FAILED':
        return PortalState.failed;
    }
    throw Exception('$this is not known in enum PortalState');
  }
}

/// Contains information about the current status of a portal.
class PortalStatus {
  /// The current state of the portal.
  final PortalState state;

  /// Contains associated error information, if any.
  final MonitorErrorDetails? error;

  PortalStatus({
    required this.state,
    this.error,
  });
  factory PortalStatus.fromJson(Map<String, dynamic> json) {
    return PortalStatus(
      state: (json['state'] as String).toPortalState(),
      error: json['error'] != null
          ? MonitorErrorDetails.fromJson(json['error'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains a portal summary.
class PortalSummary {
  /// The ID of the portal.
  final String id;

  /// The name of the portal.
  final String name;

  /// The URL for the AWS IoT SiteWise Monitor portal. You can use this URL to
  /// access portals that use AWS SSO for authentication. For portals that use IAM
  /// for authentication, you must use the AWS IoT SiteWise console to get a URL
  /// that you can use to access the portal.
  final String startUrl;
  final PortalStatus status;

  /// The date the portal was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The portal's description.
  final String? description;

  /// The date the portal was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  /// The <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">ARN</a>
  /// of the service role that allows the portal's users to access your AWS IoT
  /// SiteWise resources on your behalf. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/monitor-service-role.html">Using
  /// service roles for AWS IoT SiteWise Monitor</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  final String? roleArn;

  PortalSummary({
    required this.id,
    required this.name,
    required this.startUrl,
    required this.status,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
    this.roleArn,
  });
  factory PortalSummary.fromJson(Map<String, dynamic> json) {
    return PortalSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      startUrl: json['startUrl'] as String,
      status: PortalStatus.fromJson(json['status'] as Map<String, dynamic>),
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
      roleArn: json['roleArn'] as String?,
    );
  }
}

/// Identifies a specific AWS IoT SiteWise Monitor project.
class ProjectResource {
  /// The ID of the project.
  final String id;

  ProjectResource({
    required this.id,
  });
  factory ProjectResource.fromJson(Map<String, dynamic> json) {
    return ProjectResource(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Contains project summary information.
class ProjectSummary {
  /// The ID of the project.
  final String id;

  /// The name of the project.
  final String name;

  /// The date the project was created, in Unix epoch time.
  final DateTime? creationDate;

  /// The project's description.
  final String? description;

  /// The date the project was last updated, in Unix epoch time.
  final DateTime? lastUpdateDate;

  ProjectSummary({
    required this.id,
    required this.name,
    this.creationDate,
    this.description,
    this.lastUpdateDate,
  });
  factory ProjectSummary.fromJson(Map<String, dynamic> json) {
    return ProjectSummary(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: timeStampFromJson(json['creationDate']),
      description: json['description'] as String?,
      lastUpdateDate: timeStampFromJson(json['lastUpdateDate']),
    );
  }
}

/// Contains asset property information.
class Property {
  /// The property data type.
  final PropertyDataType dataType;

  /// The ID of the asset property.
  final String id;

  /// The name of the property.
  final String name;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  final String? alias;

  /// The asset property's notification topic and state. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_UpdateAssetProperty.html">UpdateAssetProperty</a>.
  final PropertyNotification? notification;

  /// The property type (see <code>PropertyType</code>). A property contains one
  /// type.
  final PropertyType? type;

  /// The unit (such as <code>Newtons</code> or <code>RPM</code>) of the asset
  /// property.
  final String? unit;

  Property({
    required this.dataType,
    required this.id,
    required this.name,
    this.alias,
    this.notification,
    this.type,
    this.unit,
  });
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      dataType: (json['dataType'] as String).toPropertyDataType(),
      id: json['id'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String?,
      notification: json['notification'] != null
          ? PropertyNotification.fromJson(
              json['notification'] as Map<String, dynamic>)
          : null,
      type: json['type'] != null
          ? PropertyType.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as String?,
    );
  }
}

enum PropertyDataType {
  string,
  integer,
  double,
  boolean,
  struct,
}

extension PropertyDataTypeValueExtension on PropertyDataType {
  String toValue() {
    switch (this) {
      case PropertyDataType.string:
        return 'STRING';
      case PropertyDataType.integer:
        return 'INTEGER';
      case PropertyDataType.double:
        return 'DOUBLE';
      case PropertyDataType.boolean:
        return 'BOOLEAN';
      case PropertyDataType.struct:
        return 'STRUCT';
    }
  }
}

extension PropertyDataTypeFromString on String {
  PropertyDataType toPropertyDataType() {
    switch (this) {
      case 'STRING':
        return PropertyDataType.string;
      case 'INTEGER':
        return PropertyDataType.integer;
      case 'DOUBLE':
        return PropertyDataType.double;
      case 'BOOLEAN':
        return PropertyDataType.boolean;
      case 'STRUCT':
        return PropertyDataType.struct;
    }
    throw Exception('$this is not known in enum PropertyDataType');
  }
}

/// Contains asset property value notification information. When the
/// notification state is enabled, AWS IoT SiteWise publishes property value
/// updates to a unique MQTT topic. For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/interact-with-other-services.html">Interacting
/// with other services</a> in the <i>AWS IoT SiteWise User Guide</i>.
class PropertyNotification {
  /// The current notification state.
  final PropertyNotificationState state;

  /// The MQTT topic to which AWS IoT SiteWise publishes property value update
  /// notifications.
  final String topic;

  PropertyNotification({
    required this.state,
    required this.topic,
  });
  factory PropertyNotification.fromJson(Map<String, dynamic> json) {
    return PropertyNotification(
      state: (json['state'] as String).toPropertyNotificationState(),
      topic: json['topic'] as String,
    );
  }
}

enum PropertyNotificationState {
  enabled,
  disabled,
}

extension PropertyNotificationStateValueExtension on PropertyNotificationState {
  String toValue() {
    switch (this) {
      case PropertyNotificationState.enabled:
        return 'ENABLED';
      case PropertyNotificationState.disabled:
        return 'DISABLED';
    }
  }
}

extension PropertyNotificationStateFromString on String {
  PropertyNotificationState toPropertyNotificationState() {
    switch (this) {
      case 'ENABLED':
        return PropertyNotificationState.enabled;
      case 'DISABLED':
        return PropertyNotificationState.disabled;
    }
    throw Exception('$this is not known in enum PropertyNotificationState');
  }
}

/// Contains a property type, which can be one of <code>attribute</code>,
/// <code>measurement</code>, <code>metric</code>, or <code>transform</code>.
class PropertyType {
  /// Specifies an asset attribute property. An attribute generally contains
  /// static information, such as the serial number of an <a
  /// href="https://en.wikipedia.org/wiki/Internet_of_things#Industrial_applications">IIoT</a>
  /// wind turbine.
  final Attribute? attribute;

  /// Specifies an asset measurement property. A measurement represents a device's
  /// raw sensor data stream, such as timestamped temperature values or
  /// timestamped power values.
  final Measurement? measurement;

  /// Specifies an asset metric property. A metric contains a mathematical
  /// expression that uses aggregate functions to process all input data points
  /// over a time interval and output a single data point, such as to calculate
  /// the average hourly temperature.
  final Metric? metric;

  /// Specifies an asset transform property. A transform contains a mathematical
  /// expression that maps a property's data points from one form to another, such
  /// as a unit conversion from Celsius to Fahrenheit.
  final Transform? transform;

  PropertyType({
    this.attribute,
    this.measurement,
    this.metric,
    this.transform,
  });
  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      attribute: json['attribute'] != null
          ? Attribute.fromJson(json['attribute'] as Map<String, dynamic>)
          : null,
      measurement: json['measurement'] != null
          ? Measurement.fromJson(json['measurement'] as Map<String, dynamic>)
          : null,
      metric: json['metric'] != null
          ? Metric.fromJson(json['metric'] as Map<String, dynamic>)
          : null,
      transform: json['transform'] != null
          ? Transform.fromJson(json['transform'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final measurement = this.measurement;
    final metric = this.metric;
    final transform = this.transform;
    return {
      if (attribute != null) 'attribute': attribute,
      if (measurement != null) 'measurement': measurement,
      if (metric != null) 'metric': metric,
      if (transform != null) 'transform': transform,
    };
  }
}

/// Contains a list of value updates for an asset property in the list of asset
/// entries consumed by the <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/APIReference/API_BatchPutAssetPropertyValue.html">BatchPutAssetPropertyValue</a>
/// API operation.
class PutAssetPropertyValueEntry {
  /// The user specified ID for the entry. You can use this ID to identify which
  /// entries failed.
  final String entryId;

  /// The list of property values to upload. You can specify up to 10
  /// <code>propertyValues</code> array elements.
  final List<AssetPropertyValue> propertyValues;

  /// The ID of the asset to update.
  final String? assetId;

  /// The property alias that identifies the property, such as an OPC-UA server
  /// data stream path (for example,
  /// <code>/company/windfarm/3/turbine/7/temperature</code>). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/connect-data-streams.html">Mapping
  /// industrial data streams to asset properties</a> in the <i>AWS IoT SiteWise
  /// User Guide</i>.
  final String? propertyAlias;

  /// The ID of the asset property for this entry.
  final String? propertyId;

  PutAssetPropertyValueEntry({
    required this.entryId,
    required this.propertyValues,
    this.assetId,
    this.propertyAlias,
    this.propertyId,
  });
  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final propertyValues = this.propertyValues;
    final assetId = this.assetId;
    final propertyAlias = this.propertyAlias;
    final propertyId = this.propertyId;
    return {
      'entryId': entryId,
      'propertyValues': propertyValues,
      if (assetId != null) 'assetId': assetId,
      if (propertyAlias != null) 'propertyAlias': propertyAlias,
      if (propertyId != null) 'propertyId': propertyId,
    };
  }
}

class PutDefaultEncryptionConfigurationResponse {
  /// The status of the account configuration. This contains the
  /// <code>ConfigurationState</code>. If there is an error, it also contains the
  /// <code>ErrorDetails</code>.
  final ConfigurationStatus configurationStatus;

  /// The type of encryption used for the encryption configuration.
  final EncryptionType encryptionType;

  /// The Key ARN of the AWS KMS CMK used for AWS KMS encryption if you use
  /// <code>KMS_BASED_ENCRYPTION</code>.
  final String? kmsKeyArn;

  PutDefaultEncryptionConfigurationResponse({
    required this.configurationStatus,
    required this.encryptionType,
    this.kmsKeyArn,
  });
  factory PutDefaultEncryptionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutDefaultEncryptionConfigurationResponse(
      configurationStatus: ConfigurationStatus.fromJson(
          json['configurationStatus'] as Map<String, dynamic>),
      encryptionType: (json['encryptionType'] as String).toEncryptionType(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }
}

class PutLoggingOptionsResponse {
  PutLoggingOptionsResponse();
  factory PutLoggingOptionsResponse.fromJson(Map<String, dynamic> _) {
    return PutLoggingOptionsResponse();
  }
}

enum Quality {
  good,
  bad,
  uncertain,
}

extension QualityValueExtension on Quality {
  String toValue() {
    switch (this) {
      case Quality.good:
        return 'GOOD';
      case Quality.bad:
        return 'BAD';
      case Quality.uncertain:
        return 'UNCERTAIN';
    }
  }
}

extension QualityFromString on String {
  Quality toQuality() {
    switch (this) {
      case 'GOOD':
        return Quality.good;
      case 'BAD':
        return Quality.bad;
      case 'UNCERTAIN':
        return Quality.uncertain;
    }
    throw Exception('$this is not known in enum Quality');
  }
}

/// Contains an AWS IoT SiteWise Monitor resource ID for a portal or project.
class Resource {
  /// A portal resource.
  final PortalResource? portal;

  /// A project resource.
  final ProjectResource? project;

  Resource({
    this.portal,
    this.project,
  });
  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      portal: json['portal'] != null
          ? PortalResource.fromJson(json['portal'] as Map<String, dynamic>)
          : null,
      project: json['project'] != null
          ? ProjectResource.fromJson(json['project'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portal = this.portal;
    final project = this.project;
    return {
      if (portal != null) 'portal': portal,
      if (project != null) 'project': project,
    };
  }
}

enum ResourceType {
  portal,
  project,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.portal:
        return 'PORTAL';
      case ResourceType.project:
        return 'PROJECT';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'PORTAL':
        return ResourceType.portal;
      case 'PROJECT':
        return ResourceType.project;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Contains a timestamp with optional nanosecond granularity.
class TimeInNanos {
  /// The timestamp date, in seconds, in the Unix epoch format. Fractional
  /// nanosecond data is provided by <code>offsetInNanos</code>.
  final int timeInSeconds;

  /// The nanosecond offset from <code>timeInSeconds</code>.
  final int? offsetInNanos;

  TimeInNanos({
    required this.timeInSeconds,
    this.offsetInNanos,
  });
  factory TimeInNanos.fromJson(Map<String, dynamic> json) {
    return TimeInNanos(
      timeInSeconds: json['timeInSeconds'] as int,
      offsetInNanos: json['offsetInNanos'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeInSeconds = this.timeInSeconds;
    final offsetInNanos = this.offsetInNanos;
    return {
      'timeInSeconds': timeInSeconds,
      if (offsetInNanos != null) 'offsetInNanos': offsetInNanos,
    };
  }
}

enum TimeOrdering {
  ascending,
  descending,
}

extension TimeOrderingValueExtension on TimeOrdering {
  String toValue() {
    switch (this) {
      case TimeOrdering.ascending:
        return 'ASCENDING';
      case TimeOrdering.descending:
        return 'DESCENDING';
    }
  }
}

extension TimeOrderingFromString on String {
  TimeOrdering toTimeOrdering() {
    switch (this) {
      case 'ASCENDING':
        return TimeOrdering.ascending;
      case 'DESCENDING':
        return TimeOrdering.descending;
    }
    throw Exception('$this is not known in enum TimeOrdering');
  }
}

/// Contains an asset transform property. A transform is a one-to-one mapping of
/// a property's data points from one form to another. For example, you can use
/// a transform to convert a Celsius data stream to Fahrenheit by applying the
/// transformation expression to each data point of the Celsius stream. A
/// transform can only have a data type of <code>DOUBLE</code> and consume
/// properties with data types of <code>INTEGER</code> or <code>DOUBLE</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-properties.html#transforms">Transforms</a>
/// in the <i>AWS IoT SiteWise User Guide</i>.
class Transform {
  /// The mathematical expression that defines the transformation function. You
  /// can specify up to 10 variables per expression. You can specify up to 10
  /// functions per expression.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/quotas.html">Quotas</a>
  /// in the <i>AWS IoT SiteWise User Guide</i>.
  final String expression;

  /// The list of variables used in the expression.
  final List<ExpressionVariable> variables;

  Transform({
    required this.expression,
    required this.variables,
  });
  factory Transform.fromJson(Map<String, dynamic> json) {
    return Transform(
      expression: json['expression'] as String,
      variables: (json['variables'] as List)
          .whereNotNull()
          .map((e) => ExpressionVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final variables = this.variables;
    return {
      'expression': expression,
      'variables': variables,
    };
  }
}

enum TraversalDirection {
  parent,
  child,
}

extension TraversalDirectionValueExtension on TraversalDirection {
  String toValue() {
    switch (this) {
      case TraversalDirection.parent:
        return 'PARENT';
      case TraversalDirection.child:
        return 'CHILD';
    }
  }
}

extension TraversalDirectionFromString on String {
  TraversalDirection toTraversalDirection() {
    switch (this) {
      case 'PARENT':
        return TraversalDirection.parent;
      case 'CHILD':
        return TraversalDirection.child;
    }
    throw Exception('$this is not known in enum TraversalDirection');
  }
}

enum TraversalType {
  pathToRoot,
}

extension TraversalTypeValueExtension on TraversalType {
  String toValue() {
    switch (this) {
      case TraversalType.pathToRoot:
        return 'PATH_TO_ROOT';
    }
  }
}

extension TraversalTypeFromString on String {
  TraversalType toTraversalType() {
    switch (this) {
      case 'PATH_TO_ROOT':
        return TraversalType.pathToRoot;
    }
    throw Exception('$this is not known in enum TraversalType');
  }
}

/// Contains a tumbling window, which is a repeating fixed-sized,
/// non-overlapping, and contiguous time interval. This window is used in metric
/// and aggregation computations.
class TumblingWindow {
  /// The time interval for the tumbling window. Note that <code>w</code>
  /// represents weeks, <code>d</code> represents days, <code>h</code> represents
  /// hours, and <code>m</code> represents minutes. AWS IoT SiteWise computes the
  /// <code>1w</code> interval the end of Sunday at midnight each week (UTC), the
  /// <code>1d</code> interval at the end of each day at midnight (UTC), the
  /// <code>1h</code> interval at the end of each hour, and so on.
  ///
  /// When AWS IoT SiteWise aggregates data points for metric computations, the
  /// start of each interval is exclusive and the end of each interval is
  /// inclusive. AWS IoT SiteWise places the computed data point at the end of the
  /// interval.
  final String interval;

  TumblingWindow({
    required this.interval,
  });
  factory TumblingWindow.fromJson(Map<String, dynamic> json) {
    return TumblingWindow(
      interval: json['interval'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    return {
      'interval': interval,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateAccessPolicyResponse {
  UpdateAccessPolicyResponse();
  factory UpdateAccessPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAccessPolicyResponse();
  }
}

class UpdateAssetModelResponse {
  /// The status of the asset model, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  final AssetModelStatus assetModelStatus;

  UpdateAssetModelResponse({
    required this.assetModelStatus,
  });
  factory UpdateAssetModelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssetModelResponse(
      assetModelStatus: AssetModelStatus.fromJson(
          json['assetModelStatus'] as Map<String, dynamic>),
    );
  }
}

class UpdateAssetResponse {
  /// The status of the asset, which contains a state (<code>UPDATING</code> after
  /// successfully calling this operation) and any error message.
  final AssetStatus assetStatus;

  UpdateAssetResponse({
    required this.assetStatus,
  });
  factory UpdateAssetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssetResponse(
      assetStatus:
          AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    );
  }
}

class UpdateDashboardResponse {
  UpdateDashboardResponse();
  factory UpdateDashboardResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDashboardResponse();
  }
}

class UpdateGatewayCapabilityConfigurationResponse {
  /// The namespace of the gateway capability.
  final String capabilityNamespace;

  /// The synchronization status of the capability configuration. The sync status
  /// can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_SYNC</code> – The gateway is running the capability configuration.
  /// </li>
  /// <li>
  /// <code>OUT_OF_SYNC</code> – The gateway hasn't received the capability
  /// configuration.
  /// </li>
  /// <li>
  /// <code>SYNC_FAILED</code> – The gateway rejected the capability
  /// configuration.
  /// </li>
  /// </ul>
  /// After you update a capability configuration, its sync status is
  /// <code>OUT_OF_SYNC</code> until the gateway receives and applies or rejects
  /// the updated configuration.
  final CapabilitySyncStatus capabilitySyncStatus;

  UpdateGatewayCapabilityConfigurationResponse({
    required this.capabilityNamespace,
    required this.capabilitySyncStatus,
  });
  factory UpdateGatewayCapabilityConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateGatewayCapabilityConfigurationResponse(
      capabilityNamespace: json['capabilityNamespace'] as String,
      capabilitySyncStatus:
          (json['capabilitySyncStatus'] as String).toCapabilitySyncStatus(),
    );
  }
}

class UpdatePortalResponse {
  /// The status of the portal, which contains a state (<code>UPDATING</code>
  /// after successfully calling this operation) and any error message.
  final PortalStatus portalStatus;

  UpdatePortalResponse({
    required this.portalStatus,
  });
  factory UpdatePortalResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePortalResponse(
      portalStatus:
          PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    );
  }
}

class UpdateProjectResponse {
  UpdateProjectResponse();
  factory UpdateProjectResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProjectResponse();
  }
}

/// Contains information for a user identity in an access policy.
class UserIdentity {
  /// The AWS SSO ID of the user.
  final String id;

  UserIdentity({
    required this.id,
  });
  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Identifies a property value used in an expression.
class VariableValue {
  /// The ID of the property to use as the variable. You can use the property
  /// <code>name</code> if it's from the same asset model.
  final String propertyId;

  /// The ID of the hierarchy to query for the property ID. You can use the
  /// hierarchy's name instead of the hierarchy's ID.
  ///
  /// You use a hierarchy ID instead of a model ID because you can have several
  /// hierarchies using the same model and therefore the same
  /// <code>propertyId</code>. For example, you might have separately grouped
  /// assets that come from the same asset model. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot-sitewise/latest/userguide/asset-hierarchies.html">Asset
  /// hierarchies</a> in the <i>AWS IoT SiteWise User Guide</i>.
  final String? hierarchyId;

  VariableValue({
    required this.propertyId,
    this.hierarchyId,
  });
  factory VariableValue.fromJson(Map<String, dynamic> json) {
    return VariableValue(
      propertyId: json['propertyId'] as String,
      hierarchyId: json['hierarchyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final propertyId = this.propertyId;
    final hierarchyId = this.hierarchyId;
    return {
      'propertyId': propertyId,
      if (hierarchyId != null) 'hierarchyId': hierarchyId,
    };
  }
}

/// Contains an asset property value (of a single type only).
class Variant {
  /// Asset property data of type Boolean (true or false).
  final bool? booleanValue;

  /// Asset property data of type double (floating point number).
  final double? doubleValue;

  /// Asset property data of type integer (whole number).
  final int? integerValue;

  /// Asset property data of type string (sequence of characters).
  final String? stringValue;

  Variant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });
  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      booleanValue: json['booleanValue'] as bool?,
      doubleValue: json['doubleValue'] as double?,
      integerValue: json['integerValue'] as int?,
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'booleanValue': booleanValue,
      if (doubleValue != null) 'doubleValue': doubleValue,
      if (integerValue != null) 'integerValue': integerValue,
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

class ConflictingOperationException extends _s.GenericAwsException {
  ConflictingOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConflictingOperationException',
            message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictingOperationException': (type, message) =>
      ConflictingOperationException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
