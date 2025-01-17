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

/// AWS CodeArtifact is a fully managed artifact repository compatible with
/// language-native package managers and build tools such as npm, Apache Maven,
/// NuGet, and pip. You can use CodeArtifact to share packages with development
/// teams and pull packages. Packages can be pulled from both public and
/// CodeArtifact repositories. You can also create an upstream relationship
/// between a CodeArtifact repository and another repository, which effectively
/// merges their contents from the point of view of a package manager client.
///
/// <b>AWS CodeArtifact Components</b>
///
/// Use the information in this guide to help you work with the following
/// CodeArtifact components:
///
/// <ul>
/// <li>
/// <b>Repository</b>: A CodeArtifact repository contains a set of <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/welcome.html#welcome-concepts-package-version">package
/// versions</a>, each of which maps to a set of assets, or files. Repositories
/// are polyglot, so a single repository can contain packages of any supported
/// type. Each repository exposes endpoints for fetching and publishing packages
/// using tools like the <b> <code>npm</code> </b> CLI, the <b>
/// <code>NuGet</code> </b> CLI, the Maven CLI (<b> <code>mvn</code> </b>), and
/// <b> <code>pip</code> </b>.
/// </li>
/// <li>
/// <b>Domain</b>: Repositories are aggregated into a higher-level entity known
/// as a <i>domain</i>. All package assets and metadata are stored in the
/// domain, but are consumed through repositories. A given package asset, such
/// as a Maven JAR file, is stored once per domain, no matter how many
/// repositories it's present in. All of the assets and metadata in a domain are
/// encrypted with the same customer master key (CMK) stored in AWS Key
/// Management Service (AWS KMS).
///
/// Each repository is a member of a single domain and can't be moved to a
/// different domain.
///
/// The domain allows organizational policy to be applied across multiple
/// repositories, such as which accounts can access repositories in the domain,
/// and which public repositories can be used as sources of packages.
///
/// Although an organization can have multiple domains, we recommend a single
/// production domain that contains all published artifacts so that teams can
/// find and share packages across their organization.
/// </li>
/// <li>
/// <b>Package</b>: A <i>package</i> is a bundle of software and the metadata
/// required to resolve dependencies and install the software. CodeArtifact
/// supports <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-npm.html">npm</a>,
/// <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-python.html">PyPI</a>,
/// <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-maven">Maven</a>,
/// and <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/ug/using-nuget">NuGet</a>
/// package formats.
///
/// In CodeArtifact, a package consists of:
///
/// <ul>
/// <li>
/// A <i>name</i> (for example, <code>webpack</code> is the name of a popular
/// npm package)
/// </li>
/// <li>
/// An optional namespace (for example, <code>@types</code> in
/// <code>@types/node</code>)
/// </li>
/// <li>
/// A set of versions (for example, <code>1.0.0</code>, <code>1.0.1</code>,
/// <code>1.0.2</code>, etc.)
/// </li>
/// <li>
/// Package-level metadata (for example, npm tags)
/// </li>
/// </ul> </li>
/// <li>
/// <b>Package version</b>: A version of a package, such as <code>@types/node
/// 12.6.9</code>. The version number format and semantics vary for different
/// package formats. For example, npm package versions must conform to the <a
/// href="https://semver.org/">Semantic Versioning specification</a>. In
/// CodeArtifact, a package version consists of the version identifier, metadata
/// at the package version level, and a set of assets.
/// </li>
/// <li>
/// <b>Upstream repository</b>: One repository is <i>upstream</i> of another
/// when the package versions in it can be accessed from the repository endpoint
/// of the downstream repository, effectively merging the contents of the two
/// repositories from the point of view of a client. CodeArtifact allows
/// creating an upstream relationship between two repositories.
/// </li>
/// <li>
/// <b>Asset</b>: An individual file stored in CodeArtifact associated with a
/// package version, such as an npm <code>.tgz</code> file or Maven POM and JAR
/// files.
/// </li>
/// </ul>
/// CodeArtifact supports these operations:
///
/// <ul>
/// <li>
/// <code>AssociateExternalConnection</code>: Adds an existing external
/// connection to a repository.
/// </li>
/// <li>
/// <code>CopyPackageVersions</code>: Copies package versions from one
/// repository to another repository in the same domain.
/// </li>
/// <li>
/// <code>CreateDomain</code>: Creates a domain
/// </li>
/// <li>
/// <code>CreateRepository</code>: Creates a CodeArtifact repository in a
/// domain.
/// </li>
/// <li>
/// <code>DeleteDomain</code>: Deletes a domain. You cannot delete a domain that
/// contains repositories.
/// </li>
/// <li>
/// <code>DeleteDomainPermissionsPolicy</code>: Deletes the resource policy that
/// is set on a domain.
/// </li>
/// <li>
/// <code>DeletePackageVersions</code>: Deletes versions of a package. After a
/// package has been deleted, it can be republished, but its assets and metadata
/// cannot be restored because they have been permanently removed from storage.
/// </li>
/// <li>
/// <code>DeleteRepository</code>: Deletes a repository.
/// </li>
/// <li>
/// <code>DeleteRepositoryPermissionsPolicy</code>: Deletes the resource policy
/// that is set on a repository.
/// </li>
/// <li>
/// <code>DescribeDomain</code>: Returns a <code>DomainDescription</code> object
/// that contains information about the requested domain.
/// </li>
/// <li>
/// <code>DescribePackageVersion</code>: Returns a <code> <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">PackageVersionDescription</a>
/// </code> object that contains details about a package version.
/// </li>
/// <li>
/// <code>DescribeRepository</code>: Returns a
/// <code>RepositoryDescription</code> object that contains detailed information
/// about the requested repository.
/// </li>
/// <li>
/// <code>DisposePackageVersions</code>: Disposes versions of a package. A
/// package version with the status <code>Disposed</code> cannot be restored
/// because they have been permanently removed from storage.
/// </li>
/// <li>
/// <code>DisassociateExternalConnection</code>: Removes an existing external
/// connection from a repository.
/// </li>
/// <li>
/// <code>GetAuthorizationToken</code>: Generates a temporary authorization
/// token for accessing repositories in the domain. The token expires the
/// authorization period has passed. The default authorization period is 12
/// hours and can be customized to any length with a maximum of 12 hours.
/// </li>
/// <li>
/// <code>GetDomainPermissionsPolicy</code>: Returns the policy of a resource
/// that is attached to the specified domain.
/// </li>
/// <li>
/// <code>GetPackageVersionAsset</code>: Returns the contents of an asset that
/// is in a package version.
/// </li>
/// <li>
/// <code>GetPackageVersionReadme</code>: Gets the readme file or descriptive
/// text for a package version.
/// </li>
/// <li>
/// <code>GetRepositoryEndpoint</code>: Returns the endpoint of a repository for
/// a specific package format. A repository has one endpoint for each package
/// format:
///
/// <ul>
/// <li>
/// <code>npm</code>
/// </li>
/// <li>
/// <code>pypi</code>
/// </li>
/// <li>
/// <code>maven</code>
/// </li>
/// <li>
/// <code>nuget</code>
/// </li>
/// </ul> </li>
/// <li>
/// <code>GetRepositoryPermissionsPolicy</code>: Returns the resource policy
/// that is set on a repository.
/// </li>
/// <li>
/// <code>ListDomains</code>: Returns a list of <code>DomainSummary</code>
/// objects. Each returned <code>DomainSummary</code> object contains
/// information about a domain.
/// </li>
/// <li>
/// <code>ListPackages</code>: Lists the packages in a repository.
/// </li>
/// <li>
/// <code>ListPackageVersionAssets</code>: Lists the assets for a given package
/// version.
/// </li>
/// <li>
/// <code>ListPackageVersionDependencies</code>: Returns a list of the direct
/// dependencies for a package version.
/// </li>
/// <li>
/// <code>ListPackageVersions</code>: Returns a list of package versions for a
/// specified package in a repository.
/// </li>
/// <li>
/// <code>ListRepositories</code>: Returns a list of repositories owned by the
/// AWS account that called this method.
/// </li>
/// <li>
/// <code>ListRepositoriesInDomain</code>: Returns a list of the repositories in
/// a domain.
/// </li>
/// <li>
/// <code>ListTagsForResource</code>: Returns a list of the tags associated with
/// a resource.
/// </li>
/// <li>
/// <code>PutDomainPermissionsPolicy</code>: Attaches a resource policy to a
/// domain.
/// </li>
/// <li>
/// <code>PutRepositoryPermissionsPolicy</code>: Sets the resource policy on a
/// repository that specifies permissions to access it.
/// </li>
/// <li>
/// <code>TagResource</code>: Adds or updates tags for a resource.
/// </li>
/// <li>
/// <code>UntagResource</code>: Removes a tag from a resource.
/// </li>
/// <li>
/// <code>UpdatePackageVersionsStatus</code>: Updates the status of one or more
/// versions of a package.
/// </li>
/// <li>
/// <code>UpdateRepository</code>: Updates the properties of a repository.
/// </li>
/// </ul>
class CodeArtifact {
  final _s.RestJsonProtocol _protocol;
  CodeArtifact({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeartifact',
            signingName: 'codeartifact',
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

  /// Adds an existing external connection to a repository. One external
  /// connection is allowed per repository.
  /// <note>
  /// A repository can have one or more upstream repositories, or an external
  /// connection.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository.
  ///
  /// Parameter [externalConnection] :
  /// The name of the external connection to add to the repository. The
  /// following values are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>public:npmjs</code> - for the npm public repository.
  /// </li>
  /// <li>
  /// <code>public:pypi</code> - for the Python Package Index.
  /// </li>
  /// <li>
  /// <code>public:maven-central</code> - for Maven Central.
  /// </li>
  /// <li>
  /// <code>public:maven-googleandroid</code> - for the Google Android
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:maven-gradleplugins</code> - for the Gradle plugins
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:maven-commonsware</code> - for the CommonsWare Android
  /// repository.
  /// </li>
  /// <li>
  /// <code>public:nuget-org</code> - for the NuGet Gallery.
  /// </li>
  /// </ul>
  ///
  /// Parameter [repository] :
  /// The name of the repository to which the external connection is added.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<AssociateExternalConnectionResult> associateExternalConnection({
    required String domain,
    required String externalConnection,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(externalConnection, 'externalConnection');
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'external-connection': [externalConnection],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/repository/external-connection',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateExternalConnectionResult.fromJson(response);
  }

  /// Copies package versions from one repository to another repository in the
  /// same domain.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationRepository] :
  /// The name of the repository into which package versions are copied.
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the source and destination
  /// repositories.
  ///
  /// Parameter [format] :
  /// The format of the package that is copied. The valid package types are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package that is copied.
  ///
  /// Parameter [sourceRepository] :
  /// The name of the repository that contains the package versions to copy.
  ///
  /// Parameter [allowOverwrite] :
  /// Set to true to overwrite a package version that already exists in the
  /// destination repository. If set to false and the package version already
  /// exists in the destination repository, the package version is returned in
  /// the <code>failedVersions</code> field of the response with an
  /// <code>ALREADY_EXISTS</code> error code.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [includeFromUpstream] :
  /// Set to true to copy packages from repositories that are upstream from the
  /// source repository to the destination repository. The default setting is
  /// false. For more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// A list of key-value pairs. The keys are package versions and the values
  /// are package version revisions. A <code>CopyPackageVersion</code> operation
  /// succeeds if the specified versions in the source repository match the
  /// specified package version revision.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  ///
  /// Parameter [versions] :
  /// The versions of the package to copy.
  /// <note>
  /// You must specify <code>versions</code> or <code>versionRevisions</code>.
  /// You cannot specify both.
  /// </note>
  Future<CopyPackageVersionsResult> copyPackageVersions({
    required String destinationRepository,
    required String domain,
    required PackageFormat format,
    required String package,
    required String sourceRepository,
    bool? allowOverwrite,
    String? domainOwner,
    bool? includeFromUpstream,
    String? namespace,
    Map<String, String>? versionRevisions,
    List<String>? versions,
  }) async {
    ArgumentError.checkNotNull(destinationRepository, 'destinationRepository');
    _s.validateStringLength(
      'destinationRepository',
      destinationRepository,
      2,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceRepository, 'sourceRepository');
    _s.validateStringLength(
      'sourceRepository',
      sourceRepository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'destination-repository': [destinationRepository],
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'source-repository': [sourceRepository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      if (allowOverwrite != null) 'allowOverwrite': allowOverwrite,
      if (includeFromUpstream != null)
        'includeFromUpstream': includeFromUpstream,
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
      if (versions != null) 'versions': versions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/copy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CopyPackageVersionsResult.fromJson(response);
  }

  /// Creates a domain. CodeArtifact <i>domains</i> make it easier to manage
  /// multiple repositories across an organization. You can use a domain to
  /// apply permissions across many repositories owned by different AWS
  /// accounts. An asset is stored only once in a domain, even if it's in
  /// multiple repositories.
  ///
  /// Although you can have multiple domains, we recommend a single production
  /// domain that contains all published artifacts so that your development
  /// teams can find and share packages. You can use a second pre-production
  /// domain to test changes to the production domain configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to create. All domain names in an AWS Region that
  /// are in the same AWS account must be unique. The domain name is used as the
  /// prefix in DNS hostnames. Do not use sensitive information in a domain name
  /// because it is publicly discoverable.
  ///
  /// Parameter [encryptionKey] :
  /// The encryption key for the domain. This is used to encrypt content stored
  /// in a domain. An encryption key can be a key ID, a key Amazon Resource Name
  /// (ARN), a key alias, or a key alias ARN. To specify an
  /// <code>encryptionKey</code>, your IAM role must have
  /// <code>kms:DescribeKey</code> and <code>kms:CreateGrant</code> permissions
  /// on the encryption key that is used. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestSyntax">DescribeKey</a>
  /// in the <i>AWS Key Management Service API Reference</i> and <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">AWS
  /// KMS API Permissions Reference</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// <important>
  /// CodeArtifact supports only symmetric CMKs. Do not associate an asymmetric
  /// CMK with your domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// symmetric and asymmetric keys</a> in the <i>AWS Key Management Service
  /// Developer Guide</i>.
  /// </important>
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the domain.
  Future<CreateDomainResult> createDomain({
    required String domain,
    String? encryptionKey,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKey',
      encryptionKey,
      1,
      1011,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
    };
    final $payload = <String, dynamic>{
      if (encryptionKey != null) 'encryptionKey': encryptionKey,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainResult.fromJson(response);
  }

  /// Creates a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain that contains the created repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository to create.
  ///
  /// Parameter [description] :
  /// A description of the created repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [tags] :
  /// One or more tag key-value pairs for the repository.
  ///
  /// Parameter [upstreams] :
  /// A list of upstream repositories to associate with the repository. The
  /// order of the upstream repositories in the list determines their priority
  /// order when AWS CodeArtifact looks for a requested package version. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  Future<CreateRepositoryResult> createRepository({
    required String domain,
    required String repository,
    String? description,
    String? domainOwner,
    List<Tag>? tags,
    List<UpstreamRepository>? upstreams,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (upstreams != null) 'upstreams': upstreams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateRepositoryResult.fromJson(response);
  }

  /// Deletes a domain. You cannot delete a domain that contains repositories.
  /// If you want to delete a domain with repositories, first delete its
  /// repositories.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<DeleteDomainResult> deleteDomain({
    required String domain,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResult.fromJson(response);
  }

  /// Deletes the resource policy set on a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain associated with the resource policy to be deleted.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The current revision of the resource policy to be deleted. This revision
  /// is used for optimistic locking, which prevents others from overwriting
  /// your changes to the domain's resource policy.
  Future<DeleteDomainPermissionsPolicyResult> deleteDomainPermissionsPolicy({
    required String domain,
    String? domainOwner,
    String? policyRevision,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'policyRevision',
      policyRevision,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (policyRevision != null) 'policy-revision': [policyRevision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/domain/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Deletes one or more versions of a package. A deleted package version
  /// cannot be restored in your repository. If you want to remove a package
  /// version from your repository and be able to restore it later, set its
  /// status to <code>Archived</code>. Archived packages cannot be downloaded
  /// from a repository and don't show up with list package APIs (for example,
  /// <code> <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">ListackageVersions</a>
  /// </code>), but you can restore them using <code> <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdatePackageVersionsStatus.html">UpdatePackageVersionsStatus</a>
  /// </code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the package to delete.
  ///
  /// Parameter [format] :
  /// The format of the package versions to delete. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package with the versions to delete.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package versions to delete.
  ///
  /// Parameter [versions] :
  /// An array of strings that specify the versions of the package to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The expected status of the package version to delete. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  Future<DeletePackageVersionsResult> deletePackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versions, 'versions');
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/delete',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeletePackageVersionsResult.fromJson(response);
  }

  /// Deletes a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository to delete.
  ///
  /// Parameter [repository] :
  /// The name of the repository to delete.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<DeleteRepositoryResult> deleteRepository({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRepositoryResult.fromJson(response);
  }

  /// Deletes the resource policy that is set on a repository. After a resource
  /// policy is deleted, the permissions allowed and denied by the deleted
  /// policy are removed. The effect of deleting a resource policy might not be
  /// immediate.
  /// <important>
  /// Use <code>DeleteRepositoryPermissionsPolicy</code> with caution. After a
  /// policy is deleted, AWS users, roles, and accounts lose permissions to
  /// perform the repository actions granted by the deleted policy.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository associated with the
  /// resource policy to be deleted.
  ///
  /// Parameter [repository] :
  /// The name of the repository that is associated with the resource policy to
  /// be deleted
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The revision of the repository's resource policy to be deleted. This
  /// revision is used for optimistic locking, which prevents others from
  /// accidentally overwriting your changes to the repository's resource policy.
  Future<DeleteRepositoryPermissionsPolicyResult>
      deleteRepositoryPermissionsPolicy({
    required String domain,
    required String repository,
    String? domainOwner,
    String? policyRevision,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'policyRevision',
      policyRevision,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (policyRevision != null) 'policy-revision': [policyRevision],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository/permissions/policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainDescription.html">
  /// <code>DomainDescription</code> </a> object that contains information about
  /// the requested domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// A string that specifies the name of the requested domain.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<DescribeDomainResult> describeDomain({
    required String domain,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainResult.fromJson(response);
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">
  /// <code>PackageVersionDescription</code> </a> object that contains
  /// information about the requested package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the requested package version. The
  /// valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the requested package version.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package version.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  Future<DescribePackageVersionResult> describePackageVersion({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageVersion, 'packageVersion');
    _s.validateStringLength(
      'packageVersion',
      packageVersion,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribePackageVersionResult.fromJson(response);
  }

  /// Returns a <code>RepositoryDescription</code> object that contains detailed
  /// information about the requested repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository to describe.
  ///
  /// Parameter [repository] :
  /// A string that specifies the name of the requested repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<DescribeRepositoryResult> describeRepository({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRepositoryResult.fromJson(response);
  }

  /// Removes an existing external connection from a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository from which to remove
  /// the external repository.
  ///
  /// Parameter [externalConnection] :
  /// The name of the external connection to be removed from the repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository from which the external connection will be
  /// removed.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<DisassociateExternalConnectionResult> disassociateExternalConnection({
    required String domain,
    required String externalConnection,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(externalConnection, 'externalConnection');
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'external-connection': [externalConnection],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/repository/external-connection',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateExternalConnectionResult.fromJson(response);
  }

  /// Deletes the assets in package versions and sets the package versions'
  /// status to <code>Disposed</code>. A disposed package version cannot be
  /// restored in your repository because its assets are deleted.
  ///
  /// To view all disposed package versions in a repository, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">
  /// <code>ListPackageVersions</code> </a> and set the <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html#API_ListPackageVersions_RequestSyntax">
  /// <code>status</code> </a> parameter to <code>Disposed</code>.
  ///
  /// To view information about a disposed package version, use <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DescribePackageVersion.html">
  /// <code>DescribePackageVersion</code> </a>..
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository you want to dispose.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of package versions you want to dispose.
  /// The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package with the versions you want to dispose.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package versions you want to
  /// dispose.
  ///
  /// Parameter [versions] :
  /// The versions of the package you want to dispose.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The expected status of the package version to dispose. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// The revisions of the package versions you want to dispose.
  Future<DisposePackageVersionsResult> disposePackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
    Map<String, String>? versionRevisions,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versions, 'versions');
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/dispose',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisposePackageVersionsResult.fromJson(response);
  }

  /// Generates a temporary authorization token for accessing repositories in
  /// the domain. This API requires the
  /// <code>codeartifact:GetAuthorizationToken</code> and
  /// <code>sts:GetServiceBearerToken</code> permissions. For more information
  /// about authorization tokens, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/tokens-authentication.html">AWS
  /// CodeArtifact authentication and tokens</a>.
  /// <note>
  /// CodeArtifact authorization tokens are valid for a period of 12 hours when
  /// created with the <code>login</code> command. You can call
  /// <code>login</code> periodically to refresh the token. When you create an
  /// authorization token with the <code>GetAuthorizationToken</code> API, you
  /// can set a custom authorization period, up to a maximum of 12 hours, with
  /// the <code>durationSeconds</code> parameter.
  ///
  /// The authorization period begins after <code>login</code> or
  /// <code>GetAuthorizationToken</code> is called. If <code>login</code> or
  /// <code>GetAuthorizationToken</code> is called while assuming a role, the
  /// token lifetime is independent of the maximum session duration of the role.
  /// For example, if you call <code>sts assume-role</code> and specify a
  /// session duration of 15 minutes, then generate a CodeArtifact authorization
  /// token, the token will be valid for the full authorization period even
  /// though this is longer than the 15-minute session duration.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use.html">Using
  /// IAM Roles</a> for more information on controlling session duration.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that is in scope for the generated authorization
  /// token.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [durationSeconds] :
  /// The time, in seconds, that the generated authorization token is valid.
  /// Valid values are <code>0</code> and any number between <code>900</code>
  /// (15 minutes) and <code>43200</code> (12 hours). A value of <code>0</code>
  /// will set the expiration of the authorization token to the same expiration
  /// of the user's role's temporary credentials.
  Future<GetAuthorizationTokenResult> getAuthorizationToken({
    required String domain,
    String? domainOwner,
    int? durationSeconds,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      0,
      43200,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (durationSeconds != null) 'duration': [durationSeconds.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/authorization-token',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthorizationTokenResult.fromJson(response);
  }

  /// Returns the resource policy attached to the specified domain.
  /// <note>
  /// The policy is a resource-based policy, not an identity-based policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html">Identity-based
  /// policies and resource-based policies </a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain to which the resource policy is attached.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<GetDomainPermissionsPolicyResult> getDomainPermissionsPolicy({
    required String domain,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/domain/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Returns an asset (or file) that is in a package. For example, for a Maven
  /// package version, use <code>GetPackageVersionAsset</code> to download a
  /// <code>JAR</code> file, a <code>POM</code> file, or any other assets in the
  /// package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [asset] :
  /// The name of the requested asset.
  ///
  /// Parameter [domain] :
  /// The domain that contains the repository that contains the package version
  /// with the requested asset.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package version with the requested
  /// asset file. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package that contains the requested asset.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The repository that contains the package version with the requested asset.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [packageVersionRevision] :
  /// The name of the package version revision that contains the requested
  /// asset.
  Future<GetPackageVersionAssetResult> getPackageVersionAsset({
    required String asset,
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
    String? packageVersionRevision,
  }) async {
    ArgumentError.checkNotNull(asset, 'asset');
    _s.validateStringLength(
      'asset',
      asset,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageVersion, 'packageVersion');
    _s.validateStringLength(
      'packageVersion',
      packageVersion,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    _s.validateStringLength(
      'packageVersionRevision',
      packageVersionRevision,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'asset': [asset],
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
      if (packageVersionRevision != null) 'revision': [packageVersionRevision],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version/asset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionAssetResult(
      asset: await response.stream.toBytes(),
      assetName: _s.extractHeaderStringValue(response.headers, 'X-AssetName'),
      packageVersion:
          _s.extractHeaderStringValue(response.headers, 'X-PackageVersion'),
      packageVersionRevision: _s.extractHeaderStringValue(
          response.headers, 'X-PackageVersionRevision'),
    );
  }

  /// Gets the readme file or descriptive text for a package version. For
  /// packages that do not contain a readme file, CodeArtifact extracts a
  /// description from a metadata file. For example, from the
  /// <code>&lt;description&gt;</code> element in the <code>pom.xml</code> file
  /// of a Maven package.
  ///
  /// The returned text might contain formatting. For example, it might contain
  /// formatting for Markdown or reStructuredText.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// package version with the requested readme file.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package version with the requested
  /// readme file. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package version that contains the requested readme file.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The repository that contains the package with the requested readme file.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  Future<GetPackageVersionReadmeResult> getPackageVersionReadme({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageVersion, 'packageVersion');
    _s.validateStringLength(
      'packageVersion',
      packageVersion,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/package/version/readme',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPackageVersionReadmeResult.fromJson(response);
  }

  /// Returns the endpoint of a repository for a specific package format. A
  /// repository has one endpoint for each package format:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository.
  ///
  /// Parameter [format] :
  /// Returns which endpoint of a repository to return. A repository has one
  /// endpoint for each package format:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [repository] :
  /// The name of the repository.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain that
  /// contains the repository. It does not include dashes or spaces.
  Future<GetRepositoryEndpointResult> getRepositoryEndpoint({
    required String domain,
    required PackageFormat format,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository/endpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRepositoryEndpointResult.fromJson(response);
  }

  /// Returns the resource policy that is set on a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the repository whose associated resource
  /// policy is to be retrieved.
  ///
  /// Parameter [repository] :
  /// The name of the repository whose associated resource policy is to be
  /// retrieved.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  Future<GetRepositoryPermissionsPolicyResult> getRepositoryPermissionsPolicy({
    required String domain,
    required String repository,
    String? domainOwner,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/repository/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Returns a list of <code> <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">DomainSummary</a>
  /// </code> objects for all domains owned by the AWS account that makes this
  /// call. Each returned <code>DomainSummary</code> object contains information
  /// about a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListDomainsResult> listDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/domains',
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html">
  /// <code>AssetSummary</code> </a> objects for assets in a package version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository associated with the
  /// package version assets.
  ///
  /// Parameter [format] :
  /// The format of the package that contains the returned package version
  /// assets. The valid package types are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package that contains the returned package version assets.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package that contains the
  /// returned package version assets.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListPackageVersionAssetsResult> listPackageVersionAssets({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    int? maxResults,
    String? namespace,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageVersion, 'packageVersion');
    _s.validateStringLength(
      'packageVersion',
      packageVersion,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/version/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionAssetsResult.fromJson(response);
  }

  /// Returns the direct dependencies for a package version. The dependencies
  /// are returned as <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDependency.html">
  /// <code>PackageDependency</code> </a> objects. CodeArtifact extracts the
  /// dependencies for a package version from the metadata file for the package
  /// format (for example, the <code>package.json</code> file for npm packages
  /// and the <code>pom.xml</code> file for Maven). Any package version
  /// dependencies that are not listed in the configuration file are not
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain that contains the repository that contains the requested
  /// package version dependencies.
  ///
  /// Parameter [format] :
  /// The format of the package with the requested dependencies. The valid
  /// package types are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package versions' package.
  ///
  /// Parameter [packageVersion] :
  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the requested package version.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListPackageVersionDependenciesResult> listPackageVersionDependencies({
    required String domain,
    required PackageFormat format,
    required String package,
    required String packageVersion,
    required String repository,
    String? domainOwner,
    String? namespace,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(packageVersion, 'packageVersion');
    _s.validateStringLength(
      'packageVersion',
      packageVersion,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'version': [packageVersion],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/version/dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionDependenciesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionSummary.html">
  /// <code>PackageVersionSummary</code> </a> objects for package versions in a
  /// repository that match the request parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the repository that contains the
  /// returned package versions.
  ///
  /// Parameter [format] :
  /// The format of the returned packages. The valid package types are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package for which you want to return a list of package
  /// versions.
  ///
  /// Parameter [repository] :
  /// The name of the repository that contains the package.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [sortBy] :
  /// How to sort the returned list of package versions.
  ///
  /// Parameter [status] :
  /// A string that specifies the status of the package versions to include in
  /// the returned list. It can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  Future<ListPackageVersionsResult> listPackageVersions({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    String? domainOwner,
    int? maxResults,
    String? namespace,
    String? nextToken,
    PackageVersionSortType? sortBy,
    PackageVersionStatus? status,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/package/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackageVersionsResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageSummary.html">
  /// <code>PackageSummary</code> </a> objects for packages in a repository that
  /// match the request parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain that contains the repository that contains the requested list
  /// of packages.
  ///
  /// Parameter [repository] :
  /// The name of the repository from which packages are to be listed.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [format] :
  /// The format of the packages. The valid package types are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [packagePrefix] :
  /// A prefix used to filter returned packages. Only packages with names that
  /// start with <code>packagePrefix</code> are returned.
  Future<ListPackagesResult> listPackages({
    required String domain,
    required String repository,
    String? domainOwner,
    PackageFormat? format,
    int? maxResults,
    String? namespace,
    String? nextToken,
    String? packagePrefix,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    _s.validateStringLength(
      'packagePrefix',
      packagePrefix,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (format != null) 'format': [format.toValue()],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (nextToken != null) 'next-token': [nextToken],
      if (packagePrefix != null) 'package-prefix': [packagePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/packages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPackagesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">
  /// <code>RepositorySummary</code> </a> objects. Each
  /// <code>RepositorySummary</code> contains information about a repository in
  /// the specified AWS account and that matches the input parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [repositoryPrefix] :
  /// A prefix used to filter returned repositories. Only repositories with
  /// names that start with <code>repositoryPrefix</code> are returned.
  Future<ListRepositoriesResult> listRepositories({
    int? maxResults,
    String? nextToken,
    String? repositoryPrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    _s.validateStringLength(
      'repositoryPrefix',
      repositoryPrefix,
      2,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (repositoryPrefix != null) 'repository-prefix': [repositoryPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/repositories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoriesResult.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">
  /// <code>RepositorySummary</code> </a> objects. Each
  /// <code>RepositorySummary</code> contains information about a repository in
  /// the specified domain and that matches the input parameters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain that contains the returned list of repositories.
  ///
  /// Parameter [administratorAccount] :
  /// Filter the list of repositories to only include those that are managed by
  /// the AWS account ID.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [repositoryPrefix] :
  /// A prefix used to filter returned repositories. Only repositories with
  /// names that start with <code>repositoryPrefix</code> are returned.
  Future<ListRepositoriesInDomainResult> listRepositoriesInDomain({
    required String domain,
    String? administratorAccount,
    String? domainOwner,
    int? maxResults,
    String? nextToken,
    String? repositoryPrefix,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    _s.validateStringLength(
      'administratorAccount',
      administratorAccount,
      12,
      12,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    _s.validateStringLength(
      'repositoryPrefix',
      repositoryPrefix,
      2,
      100,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      if (administratorAccount != null)
        'administrator-account': [administratorAccount],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (repositoryPrefix != null) 'repository-prefix': [repositoryPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/domain/repositories',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRepositoriesInDomainResult.fromJson(response);
  }

  /// Gets information about AWS tags for a specified Amazon Resource Name (ARN)
  /// in AWS CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to get tags for.
  Future<ListTagsForResourceResult> listTagsForResource({
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
      method: 'POST',
      requestUri: '/v1/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// Sets a resource policy on a domain that specifies permissions to access
  /// it.
  ///
  /// When you call <code>PutDomainPermissionsPolicy</code>, the resource policy
  /// on the domain is ignored when evaluting permissions. This ensures that the
  /// owner of a domain cannot lock themselves out of the domain, which would
  /// prevent them from being able to update the resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain on which to set the resource policy.
  ///
  /// Parameter [policyDocument] :
  /// A valid displayable JSON Aspen policy string to be set as the access
  /// control resource policy on the provided domain.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// The current revision of the resource policy to be set. This revision is
  /// used for optimistic locking, which prevents others from overwriting your
  /// changes to the domain's resource policy.
  Future<PutDomainPermissionsPolicyResult> putDomainPermissionsPolicy({
    required String domain,
    required String policyDocument,
    String? domainOwner,
    String? policyRevision,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      5120,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'policyRevision',
      policyRevision,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'domain': domain,
      'policyDocument': policyDocument,
      if (domainOwner != null) 'domainOwner': domainOwner,
      if (policyRevision != null) 'policyRevision': policyRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/domain/permissions/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutDomainPermissionsPolicyResult.fromJson(response);
  }

  /// Sets the resource policy on a repository that specifies permissions to
  /// access it.
  ///
  /// When you call <code>PutRepositoryPermissionsPolicy</code>, the resource
  /// policy on the repository is ignored when evaluting permissions. This
  /// ensures that the owner of a repository cannot lock themselves out of the
  /// repository, which would prevent them from being able to update the
  /// resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain containing the repository to set the resource
  /// policy on.
  ///
  /// Parameter [policyDocument] :
  /// A valid displayable JSON Aspen policy string to be set as the access
  /// control resource policy on the provided repository.
  ///
  /// Parameter [repository] :
  /// The name of the repository to set the resource policy on.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [policyRevision] :
  /// Sets the revision of the resource policy that specifies permissions to
  /// access the repository. This revision is used for optimistic locking, which
  /// prevents others from overwriting your changes to the repository's resource
  /// policy.
  Future<PutRepositoryPermissionsPolicyResult> putRepositoryPermissionsPolicy({
    required String domain,
    required String policyDocument,
    required String repository,
    String? domainOwner,
    String? policyRevision,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    _s.validateStringLength(
      'policyDocument',
      policyDocument,
      1,
      5120,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'policyRevision',
      policyRevision,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      if (policyRevision != null) 'policyRevision': policyRevision,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/repository/permissions/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutRepositoryPermissionsPolicyResult.fromJson(response);
  }

  /// Adds or updates tags for a resource in AWS CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add or
  /// update tags for.
  ///
  /// Parameter [tags] :
  /// The tags you want to modify or add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
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
      requestUri: '/v1/tag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource in AWS CodeArtifact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag key for each tag that you want to remove from the resource.
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
    };
    final $payload = <String, dynamic>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/untag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status of one or more versions of a package.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain that contains the repository that contains the package versions
  /// with a status to be updated.
  ///
  /// Parameter [format] :
  /// A format that specifies the type of the package with the statuses to
  /// update. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [package] :
  /// The name of the package with the version statuses to update.
  ///
  /// Parameter [repository] :
  /// The repository that contains the package versions with the status you want
  /// to update.
  ///
  /// Parameter [targetStatus] :
  /// The status you want to change the package version status to.
  ///
  /// Parameter [versions] :
  /// An array of strings that specify the versions of the package with the
  /// statuses to update.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [expectedStatus] :
  /// The package version’s expected status before it is updated. If
  /// <code>expectedStatus</code> is provided, the package version's status is
  /// updated only if its status at the time
  /// <code>UpdatePackageVersionsStatus</code> is called matches
  /// <code>expectedStatus</code>.
  ///
  /// Parameter [namespace] :
  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  ///
  /// Parameter [versionRevisions] :
  /// A map of package versions and package version revisions. The map
  /// <code>key</code> is the package version (for example, <code>3.5.2</code>),
  /// and the map <code>value</code> is the package version revision.
  Future<UpdatePackageVersionsStatusResult> updatePackageVersionsStatus({
    required String domain,
    required PackageFormat format,
    required String package,
    required String repository,
    required PackageVersionStatus targetStatus,
    required List<String> versions,
    String? domainOwner,
    PackageVersionStatus? expectedStatus,
    String? namespace,
    Map<String, String>? versionRevisions,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(package, 'package');
    _s.validateStringLength(
      'package',
      package,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetStatus, 'targetStatus');
    ArgumentError.checkNotNull(versions, 'versions');
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    _s.validateStringLength(
      'namespace',
      namespace,
      1,
      255,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'format': [format.toValue()],
      'package': [package],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
      if (namespace != null) 'namespace': [namespace],
    };
    final $payload = <String, dynamic>{
      'targetStatus': targetStatus.toValue(),
      'versions': versions,
      if (expectedStatus != null) 'expectedStatus': expectedStatus.toValue(),
      if (versionRevisions != null) 'versionRevisions': versionRevisions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/package/versions/update_status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePackageVersionsStatusResult.fromJson(response);
  }

  /// Update the properties of a repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The name of the domain associated with the repository to update.
  ///
  /// Parameter [repository] :
  /// The name of the repository to update.
  ///
  /// Parameter [description] :
  /// An updated repository description.
  ///
  /// Parameter [domainOwner] :
  /// The 12-digit account number of the AWS account that owns the domain. It
  /// does not include dashes or spaces.
  ///
  /// Parameter [upstreams] :
  /// A list of upstream repositories to associate with the repository. The
  /// order of the upstream repositories in the list determines their priority
  /// order when AWS CodeArtifact looks for a requested package version. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  Future<UpdateRepositoryResult> updateRepository({
    required String domain,
    required String repository,
    String? description,
    String? domainOwner,
    List<UpstreamRepository>? upstreams,
  }) async {
    ArgumentError.checkNotNull(domain, 'domain');
    _s.validateStringLength(
      'domain',
      domain,
      2,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repository, 'repository');
    _s.validateStringLength(
      'repository',
      repository,
      2,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'domainOwner',
      domainOwner,
      12,
      12,
    );
    final $query = <String, List<String>>{
      'domain': [domain],
      'repository': [repository],
      if (domainOwner != null) 'domain-owner': [domainOwner],
    };
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (upstreams != null) 'upstreams': upstreams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/repository',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRepositoryResult.fromJson(response);
  }
}

/// Contains details about a package version asset.
class AssetSummary {
  /// The name of the asset.
  final String name;

  /// The hashes of the asset.
  final Map<HashAlgorithm, String>? hashes;

  /// The size of the asset.
  final int? size;

  AssetSummary({
    required this.name,
    this.hashes,
    this.size,
  });
  factory AssetSummary.fromJson(Map<String, dynamic> json) {
    return AssetSummary(
      name: json['name'] as String,
      hashes: (json['hashes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toHashAlgorithm(), e as String)),
      size: json['size'] as int?,
    );
  }
}

class AssociateExternalConnectionResult {
  /// Information about the connected repository after processing the request.
  final RepositoryDescription? repository;

  AssociateExternalConnectionResult({
    this.repository,
  });
  factory AssociateExternalConnectionResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateExternalConnectionResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CopyPackageVersionsResult {
  /// A map of package versions that failed to copy and their error codes. The
  /// possible error codes are in the <code>PackageVersionError</code> data type.
  /// They are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully copied to your
  /// repository.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  CopyPackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });
  factory CopyPackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return CopyPackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }
}

class CreateDomainResult {
  /// Contains information about the created domain after processing the request.
  final DomainDescription? domain;

  CreateDomainResult({
    this.domain,
  });
  factory CreateDomainResult.fromJson(Map<String, dynamic> json) {
    return CreateDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateRepositoryResult {
  /// Information about the created repository after processing the request.
  final RepositoryDescription? repository;

  CreateRepositoryResult({
    this.repository,
  });
  factory CreateRepositoryResult.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteDomainPermissionsPolicyResult {
  /// Information about the deleted resource policy after processing the request.
  final ResourcePolicy? policy;

  DeleteDomainPermissionsPolicyResult({
    this.policy,
  });
  factory DeleteDomainPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteDomainResult {
  /// Contains information about the deleted domain after processing the request.
  final DomainDescription? domain;

  DeleteDomainResult({
    this.domain,
  });
  factory DeleteDomainResult.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeletePackageVersionsResult {
  /// A <code>PackageVersionError</code> object that contains a map of errors
  /// codes for the deleted package that failed. The possible error codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully deleted.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  DeletePackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });
  factory DeletePackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return DeletePackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }
}

class DeleteRepositoryPermissionsPolicyResult {
  /// Information about the deleted policy after processing the request.
  final ResourcePolicy? policy;

  DeleteRepositoryPermissionsPolicyResult({
    this.policy,
  });
  factory DeleteRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeleteRepositoryResult {
  /// Information about the deleted repository after processing the request.
  final RepositoryDescription? repository;

  DeleteRepositoryResult({
    this.repository,
  });
  factory DeleteRepositoryResult.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribeDomainResult {
  final DomainDescription? domain;

  DescribeDomainResult({
    this.domain,
  });
  factory DescribeDomainResult.fromJson(Map<String, dynamic> json) {
    return DescribeDomainResult(
      domain: json['domain'] != null
          ? DomainDescription.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DescribePackageVersionResult {
  /// A <code> <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionDescription.html">PackageVersionDescription</a>
  /// </code> object that contains information about the requested package
  /// version.
  final PackageVersionDescription packageVersion;

  DescribePackageVersionResult({
    required this.packageVersion,
  });
  factory DescribePackageVersionResult.fromJson(Map<String, dynamic> json) {
    return DescribePackageVersionResult(
      packageVersion: PackageVersionDescription.fromJson(
          json['packageVersion'] as Map<String, dynamic>),
    );
  }
}

class DescribeRepositoryResult {
  /// A <code>RepositoryDescription</code> object that contains the requested
  /// repository information.
  final RepositoryDescription? repository;

  DescribeRepositoryResult({
    this.repository,
  });
  factory DescribeRepositoryResult.fromJson(Map<String, dynamic> json) {
    return DescribeRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DisassociateExternalConnectionResult {
  /// The repository associated with the removed external connection.
  final RepositoryDescription? repository;

  DisassociateExternalConnectionResult({
    this.repository,
  });
  factory DisassociateExternalConnectionResult.fromJson(
      Map<String, dynamic> json) {
    return DisassociateExternalConnectionResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DisposePackageVersionsResult {
  /// A <code>PackageVersionError</code> object that contains a map of errors
  /// codes for the disposed package versions that failed. The possible error
  /// codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of the package versions that were successfully disposed.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  DisposePackageVersionsResult({
    this.failedVersions,
    this.successfulVersions,
  });
  factory DisposePackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return DisposePackageVersionsResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }
}

/// Information about a domain. A domain is a container for repositories. When
/// you create a domain, it is empty until you add one or more repositories.
class DomainDescription {
  /// The Amazon Resource Name (ARN) of the domain.
  final String? arn;

  /// The total size of all assets in the domain.
  final int? assetSizeBytes;

  /// A timestamp that represents the date and time the domain was created.
  final DateTime? createdTime;

  /// The ARN of an AWS Key Management Service (AWS KMS) key associated with a
  /// domain.
  final String? encryptionKey;

  /// The name of the domain.
  final String? name;

  /// The AWS account ID that owns the domain.
  final String? owner;

  /// The number of repositories in the domain.
  final int? repositoryCount;

  /// The Amazon Resource Name (ARN) of the Amazon S3 bucket that is used to store
  /// package assets in the domain.
  final String? s3BucketArn;

  /// The current status of a domain. The valid values are
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>
  /// </li>
  /// <li>
  /// <code>Deleted</code>
  /// </li>
  /// </ul>
  final DomainStatus? status;

  DomainDescription({
    this.arn,
    this.assetSizeBytes,
    this.createdTime,
    this.encryptionKey,
    this.name,
    this.owner,
    this.repositoryCount,
    this.s3BucketArn,
    this.status,
  });
  factory DomainDescription.fromJson(Map<String, dynamic> json) {
    return DomainDescription(
      arn: json['arn'] as String?,
      assetSizeBytes: json['assetSizeBytes'] as int?,
      createdTime: timeStampFromJson(json['createdTime']),
      encryptionKey: json['encryptionKey'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      repositoryCount: json['repositoryCount'] as int?,
      s3BucketArn: json['s3BucketArn'] as String?,
      status: (json['status'] as String?)?.toDomainStatus(),
    );
  }
}

enum DomainStatus {
  active,
  deleted,
}

extension DomainStatusValueExtension on DomainStatus {
  String toValue() {
    switch (this) {
      case DomainStatus.active:
        return 'Active';
      case DomainStatus.deleted:
        return 'Deleted';
    }
  }
}

extension DomainStatusFromString on String {
  DomainStatus toDomainStatus() {
    switch (this) {
      case 'Active':
        return DomainStatus.active;
      case 'Deleted':
        return DomainStatus.deleted;
    }
    throw Exception('$this is not known in enum DomainStatus');
  }
}

/// Information about a domain, including its name, Amazon Resource Name (ARN),
/// and status. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListDomains.html">
/// <code>ListDomains</code> </a> operation returns a list of
/// <code>DomainSummary</code> objects.
class DomainSummary {
  /// The ARN of the domain.
  final String? arn;

  /// A timestamp that contains the date and time the domain was created.
  final DateTime? createdTime;

  /// The key used to encrypt the domain.
  final String? encryptionKey;

  /// The name of the domain.
  final String? name;

  /// The 12-digit account number of the AWS account that owns the domain. It does
  /// not include dashes or spaces.
  final String? owner;

  /// A string that contains the status of the domain. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>Active</code>
  /// </li>
  /// <li>
  /// <code>Deleted</code>
  /// </li>
  /// </ul>
  final DomainStatus? status;

  DomainSummary({
    this.arn,
    this.createdTime,
    this.encryptionKey,
    this.name,
    this.owner,
    this.status,
  });
  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: json['arn'] as String?,
      createdTime: timeStampFromJson(json['createdTime']),
      encryptionKey: json['encryptionKey'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      status: (json['status'] as String?)?.toDomainStatus(),
    );
  }
}

enum ExternalConnectionStatus {
  available,
}

extension ExternalConnectionStatusValueExtension on ExternalConnectionStatus {
  String toValue() {
    switch (this) {
      case ExternalConnectionStatus.available:
        return 'Available';
    }
  }
}

extension ExternalConnectionStatusFromString on String {
  ExternalConnectionStatus toExternalConnectionStatus() {
    switch (this) {
      case 'Available':
        return ExternalConnectionStatus.available;
    }
    throw Exception('$this is not known in enum ExternalConnectionStatus');
  }
}

class GetAuthorizationTokenResult {
  /// The returned authentication token.
  final String? authorizationToken;

  /// A timestamp that specifies the date and time the authorization token
  /// expires.
  final DateTime? expiration;

  GetAuthorizationTokenResult({
    this.authorizationToken,
    this.expiration,
  });
  factory GetAuthorizationTokenResult.fromJson(Map<String, dynamic> json) {
    return GetAuthorizationTokenResult(
      authorizationToken: json['authorizationToken'] as String?,
      expiration: timeStampFromJson(json['expiration']),
    );
  }
}

class GetDomainPermissionsPolicyResult {
  /// The returned resource policy.
  final ResourcePolicy? policy;

  GetDomainPermissionsPolicyResult({
    this.policy,
  });
  factory GetDomainPermissionsPolicyResult.fromJson(Map<String, dynamic> json) {
    return GetDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetPackageVersionAssetResult {
  /// The binary file, or asset, that is downloaded.
  final Uint8List? asset;

  /// The name of the asset that is downloaded.
  final String? assetName;

  /// A string that contains the package version (for example,
  /// <code>3.5.2</code>).
  final String? packageVersion;

  /// The name of the package version revision that contains the downloaded asset.
  final String? packageVersionRevision;

  GetPackageVersionAssetResult({
    this.asset,
    this.assetName,
    this.packageVersion,
    this.packageVersionRevision,
  });
}

class GetPackageVersionReadmeResult {
  /// The format of the package with the requested readme file. Valid format types
  /// are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the package that contains the returned readme file.
  final String? package;

  /// The text of the returned readme file.
  final String? readme;

  /// The version of the package with the requested readme file.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  GetPackageVersionReadmeResult({
    this.format,
    this.namespace,
    this.package,
    this.readme,
    this.version,
    this.versionRevision,
  });
  factory GetPackageVersionReadmeResult.fromJson(Map<String, dynamic> json) {
    return GetPackageVersionReadmeResult(
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
      readme: json['readme'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }
}

class GetRepositoryEndpointResult {
  /// A string that specifies the URL of the returned endpoint.
  final String? repositoryEndpoint;

  GetRepositoryEndpointResult({
    this.repositoryEndpoint,
  });
  factory GetRepositoryEndpointResult.fromJson(Map<String, dynamic> json) {
    return GetRepositoryEndpointResult(
      repositoryEndpoint: json['repositoryEndpoint'] as String?,
    );
  }
}

class GetRepositoryPermissionsPolicyResult {
  /// The returned resource policy.
  final ResourcePolicy? policy;

  GetRepositoryPermissionsPolicyResult({
    this.policy,
  });
  factory GetRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return GetRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum HashAlgorithm {
  md5,
  sha_1,
  sha_256,
  sha_512,
}

extension HashAlgorithmValueExtension on HashAlgorithm {
  String toValue() {
    switch (this) {
      case HashAlgorithm.md5:
        return 'MD5';
      case HashAlgorithm.sha_1:
        return 'SHA-1';
      case HashAlgorithm.sha_256:
        return 'SHA-256';
      case HashAlgorithm.sha_512:
        return 'SHA-512';
    }
  }
}

extension HashAlgorithmFromString on String {
  HashAlgorithm toHashAlgorithm() {
    switch (this) {
      case 'MD5':
        return HashAlgorithm.md5;
      case 'SHA-1':
        return HashAlgorithm.sha_1;
      case 'SHA-256':
        return HashAlgorithm.sha_256;
      case 'SHA-512':
        return HashAlgorithm.sha_512;
    }
    throw Exception('$this is not known in enum HashAlgorithm');
  }
}

/// Details of the license data.
class LicenseInfo {
  /// Name of the license.
  final String? name;

  /// The URL for license data.
  final String? url;

  LicenseInfo({
    this.name,
    this.url,
  });
  factory LicenseInfo.fromJson(Map<String, dynamic> json) {
    return LicenseInfo(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }
}

class ListDomainsResult {
  /// The returned list of <code> <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_DomainSummary.html">DomainSummary</a>
  /// </code> objects.
  final List<DomainSummary>? domains;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListDomainsResult({
    this.domains,
    this.nextToken,
  });
  factory ListDomainsResult.fromJson(Map<String, dynamic> json) {
    return ListDomainsResult(
      domains: (json['domains'] as List?)
          ?.whereNotNull()
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListPackageVersionAssetsResult {
  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_AssetSummary.html">
  /// <code>AssetSummary</code> </a> objects.
  final List<AssetSummary>? assets;

  /// The format of the package that contains the returned package version assets.
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The name of the package that contains the returned package version assets.
  final String? package;

  /// The version of the package associated with the returned assets.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  ListPackageVersionAssetsResult({
    this.assets,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.version,
    this.versionRevision,
  });
  factory ListPackageVersionAssetsResult.fromJson(Map<String, dynamic> json) {
    return ListPackageVersionAssetsResult(
      assets: (json['assets'] as List?)
          ?.whereNotNull()
          .map((e) => AssetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }
}

class ListPackageVersionDependenciesResult {
  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageDependency.html">
  /// <code>PackageDependency</code> </a> objects.
  final List<PackageDependency>? dependencies;

  /// A format that specifies the type of the package that contains the returned
  /// dependencies. The valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  /// The name of the package that contains the returned package versions
  /// dependencies.
  final String? package;

  /// The version of the package that is specified in the request.
  final String? version;

  /// The current revision associated with the package version.
  final String? versionRevision;

  ListPackageVersionDependenciesResult({
    this.dependencies,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.version,
    this.versionRevision,
  });
  factory ListPackageVersionDependenciesResult.fromJson(
      Map<String, dynamic> json) {
    return ListPackageVersionDependenciesResult(
      dependencies: (json['dependencies'] as List?)
          ?.whereNotNull()
          .map((e) => PackageDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      version: json['version'] as String?,
      versionRevision: json['versionRevision'] as String?,
    );
  }
}

class ListPackageVersionsResult {
  /// The default package version to display. This depends on the package format:
  ///
  /// <ul>
  /// <li>
  /// For Maven and PyPI packages, it's the most recently published package
  /// version.
  /// </li>
  /// <li>
  /// For npm packages, it's the version referenced by the <code>latest</code>
  /// tag. If the <code>latest</code> tag is not set, it's the most recently
  /// published package version.
  /// </li>
  /// </ul>
  final String? defaultDisplayVersion;

  /// A format of the package. Valid package format values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The name of the package.
  final String? package;

  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageVersionSummary.html">
  /// <code>PackageVersionSummary</code> </a> objects.
  final List<PackageVersionSummary>? versions;

  ListPackageVersionsResult({
    this.defaultDisplayVersion,
    this.format,
    this.namespace,
    this.nextToken,
    this.package,
    this.versions,
  });
  factory ListPackageVersionsResult.fromJson(Map<String, dynamic> json) {
    return ListPackageVersionsResult(
      defaultDisplayVersion: json['defaultDisplayVersion'] as String?,
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      nextToken: json['nextToken'] as String?,
      package: json['package'] as String?,
      versions: (json['versions'] as List?)
          ?.whereNotNull()
          .map((e) => PackageVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListPackagesResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The list of returned <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_PackageSummary.html">
  /// <code>PackageSummary</code> </a> objects.
  final List<PackageSummary>? packages;

  ListPackagesResult({
    this.nextToken,
    this.packages,
  });
  factory ListPackagesResult.fromJson(Map<String, dynamic> json) {
    return ListPackagesResult(
      nextToken: json['nextToken'] as String?,
      packages: (json['packages'] as List?)
          ?.whereNotNull()
          .map((e) => PackageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRepositoriesInDomainResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The returned list of repositories.
  final List<RepositorySummary>? repositories;

  ListRepositoriesInDomainResult({
    this.nextToken,
    this.repositories,
  });
  factory ListRepositoriesInDomainResult.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesInDomainResult(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListRepositoriesResult {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The returned list of <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_RepositorySummary.html">
  /// <code>RepositorySummary</code> </a> objects.
  final List<RepositorySummary>? repositories;

  ListRepositoriesResult({
    this.nextToken,
    this.repositories,
  });
  factory ListRepositoriesResult.fromJson(Map<String, dynamic> json) {
    return ListRepositoriesResult(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsForResourceResult {
  /// A list of tag key and value pairs associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.tags,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Details about a package dependency.
class PackageDependency {
  /// The type of a package dependency. The possible values depend on the package
  /// type. Example types are <code>compile</code>, <code>runtime</code>, and
  /// <code>test</code> for Maven packages, and <code>dev</code>,
  /// <code>prod</code>, and <code>optional</code> for npm packages.
  final String? dependencyType;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the package that this package depends on.
  final String? package;

  /// The required version, or version range, of the package that this package
  /// depends on. The version format is specific to the package type. For example,
  /// the following are possible valid required versions: <code>1.2.3</code>,
  /// <code>^2.3.4</code>, or <code>4.x</code>.
  final String? versionRequirement;

  PackageDependency({
    this.dependencyType,
    this.namespace,
    this.package,
    this.versionRequirement,
  });
  factory PackageDependency.fromJson(Map<String, dynamic> json) {
    return PackageDependency(
      dependencyType: json['dependencyType'] as String?,
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
      versionRequirement: json['versionRequirement'] as String?,
    );
  }
}

enum PackageFormat {
  npm,
  pypi,
  maven,
  nuget,
}

extension PackageFormatValueExtension on PackageFormat {
  String toValue() {
    switch (this) {
      case PackageFormat.npm:
        return 'npm';
      case PackageFormat.pypi:
        return 'pypi';
      case PackageFormat.maven:
        return 'maven';
      case PackageFormat.nuget:
        return 'nuget';
    }
  }
}

extension PackageFormatFromString on String {
  PackageFormat toPackageFormat() {
    switch (this) {
      case 'npm':
        return PackageFormat.npm;
      case 'pypi':
        return PackageFormat.pypi;
      case 'maven':
        return PackageFormat.maven;
      case 'nuget':
        return PackageFormat.nuget;
    }
    throw Exception('$this is not known in enum PackageFormat');
  }
}

/// Details about a package, including its format, namespace, and name. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackages.html">
/// <code>ListPackages</code> </a> operation returns a list of
/// <code>PackageSummary</code> objects.
class PackageSummary {
  /// The format of the package. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>
  /// </li>
  /// <li>
  /// <code>pypi</code>
  /// </li>
  /// <li>
  /// <code>maven</code>
  /// </li>
  /// <li>
  /// <code>nuget</code>
  /// </li>
  /// </ul>
  final PackageFormat? format;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the package.
  final String? package;

  PackageSummary({
    this.format,
    this.namespace,
    this.package,
  });
  factory PackageSummary.fromJson(Map<String, dynamic> json) {
    return PackageSummary(
      format: (json['format'] as String?)?.toPackageFormat(),
      namespace: json['namespace'] as String?,
      package: json['package'] as String?,
    );
  }
}

/// Details about a package version.
class PackageVersionDescription {
  /// The name of the package that is displayed. The <code>displayName</code>
  /// varies depending on the package version's format. For example, if an npm
  /// package is named <code>ui</code>, is in the namespace <code>vue</code>, and
  /// has the format <code>npm</code>, then the <code>displayName</code> is
  /// <code>@vue/ui</code>.
  final String? displayName;

  /// The format of the package version. The valid package formats are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  final PackageFormat? format;

  /// The homepage associated with the package.
  final String? homePage;

  /// Information about licenses associated with the package version.
  final List<LicenseInfo>? licenses;

  /// The namespace of the package. The package component that specifies its
  /// namespace depends on its type. For example:
  ///
  /// <ul>
  /// <li>
  /// The namespace of a Maven package is its <code>groupId</code>.
  /// </li>
  /// <li>
  /// The namespace of an npm package is its <code>scope</code>.
  /// </li>
  /// <li>
  /// A Python package does not contain a corresponding component, so Python
  /// packages do not have a namespace.
  /// </li>
  /// <li>
  /// A NuGet package does not contain a corresponding component, so NuGet
  /// packages do not have a namespace.
  /// </li>
  /// </ul>
  final String? namespace;

  /// The name of the requested package.
  final String? packageName;

  /// A timestamp that contains the date and time the package version was
  /// published.
  final DateTime? publishedTime;

  /// The revision of the package version.
  final String? revision;

  /// The repository for the source code in the package version, or the source
  /// code used to build it.
  final String? sourceCodeRepository;

  /// A string that contains the status of the package version. It can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  final PackageVersionStatus? status;

  /// A summary of the package version. The summary is extracted from the package.
  /// The information in and detail level of the summary depends on the package
  /// version's format.
  final String? summary;

  /// The version of the package.
  final String? version;

  PackageVersionDescription({
    this.displayName,
    this.format,
    this.homePage,
    this.licenses,
    this.namespace,
    this.packageName,
    this.publishedTime,
    this.revision,
    this.sourceCodeRepository,
    this.status,
    this.summary,
    this.version,
  });
  factory PackageVersionDescription.fromJson(Map<String, dynamic> json) {
    return PackageVersionDescription(
      displayName: json['displayName'] as String?,
      format: (json['format'] as String?)?.toPackageFormat(),
      homePage: json['homePage'] as String?,
      licenses: (json['licenses'] as List?)
          ?.whereNotNull()
          .map((e) => LicenseInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['namespace'] as String?,
      packageName: json['packageName'] as String?,
      publishedTime: timeStampFromJson(json['publishedTime']),
      revision: json['revision'] as String?,
      sourceCodeRepository: json['sourceCodeRepository'] as String?,
      status: (json['status'] as String?)?.toPackageVersionStatus(),
      summary: json['summary'] as String?,
      version: json['version'] as String?,
    );
  }
}

/// An error associated with package.
class PackageVersionError {
  /// The error code associated with the error. Valid error codes are:
  ///
  /// <ul>
  /// <li>
  /// <code>ALREADY_EXISTS</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_REVISION</code>
  /// </li>
  /// <li>
  /// <code>MISMATCHED_STATUS</code>
  /// </li>
  /// <li>
  /// <code>NOT_ALLOWED</code>
  /// </li>
  /// <li>
  /// <code>NOT_FOUND</code>
  /// </li>
  /// <li>
  /// <code>SKIPPED</code>
  /// </li>
  /// </ul>
  final PackageVersionErrorCode? errorCode;

  /// The error message associated with the error.
  final String? errorMessage;

  PackageVersionError({
    this.errorCode,
    this.errorMessage,
  });
  factory PackageVersionError.fromJson(Map<String, dynamic> json) {
    return PackageVersionError(
      errorCode: (json['errorCode'] as String?)?.toPackageVersionErrorCode(),
      errorMessage: json['errorMessage'] as String?,
    );
  }
}

enum PackageVersionErrorCode {
  alreadyExists,
  mismatchedRevision,
  mismatchedStatus,
  notAllowed,
  notFound,
  skipped,
}

extension PackageVersionErrorCodeValueExtension on PackageVersionErrorCode {
  String toValue() {
    switch (this) {
      case PackageVersionErrorCode.alreadyExists:
        return 'ALREADY_EXISTS';
      case PackageVersionErrorCode.mismatchedRevision:
        return 'MISMATCHED_REVISION';
      case PackageVersionErrorCode.mismatchedStatus:
        return 'MISMATCHED_STATUS';
      case PackageVersionErrorCode.notAllowed:
        return 'NOT_ALLOWED';
      case PackageVersionErrorCode.notFound:
        return 'NOT_FOUND';
      case PackageVersionErrorCode.skipped:
        return 'SKIPPED';
    }
  }
}

extension PackageVersionErrorCodeFromString on String {
  PackageVersionErrorCode toPackageVersionErrorCode() {
    switch (this) {
      case 'ALREADY_EXISTS':
        return PackageVersionErrorCode.alreadyExists;
      case 'MISMATCHED_REVISION':
        return PackageVersionErrorCode.mismatchedRevision;
      case 'MISMATCHED_STATUS':
        return PackageVersionErrorCode.mismatchedStatus;
      case 'NOT_ALLOWED':
        return PackageVersionErrorCode.notAllowed;
      case 'NOT_FOUND':
        return PackageVersionErrorCode.notFound;
      case 'SKIPPED':
        return PackageVersionErrorCode.skipped;
    }
    throw Exception('$this is not known in enum PackageVersionErrorCode');
  }
}

enum PackageVersionSortType {
  publishedTime,
}

extension PackageVersionSortTypeValueExtension on PackageVersionSortType {
  String toValue() {
    switch (this) {
      case PackageVersionSortType.publishedTime:
        return 'PUBLISHED_TIME';
    }
  }
}

extension PackageVersionSortTypeFromString on String {
  PackageVersionSortType toPackageVersionSortType() {
    switch (this) {
      case 'PUBLISHED_TIME':
        return PackageVersionSortType.publishedTime;
    }
    throw Exception('$this is not known in enum PackageVersionSortType');
  }
}

enum PackageVersionStatus {
  published,
  unfinished,
  unlisted,
  archived,
  disposed,
  deleted,
}

extension PackageVersionStatusValueExtension on PackageVersionStatus {
  String toValue() {
    switch (this) {
      case PackageVersionStatus.published:
        return 'Published';
      case PackageVersionStatus.unfinished:
        return 'Unfinished';
      case PackageVersionStatus.unlisted:
        return 'Unlisted';
      case PackageVersionStatus.archived:
        return 'Archived';
      case PackageVersionStatus.disposed:
        return 'Disposed';
      case PackageVersionStatus.deleted:
        return 'Deleted';
    }
  }
}

extension PackageVersionStatusFromString on String {
  PackageVersionStatus toPackageVersionStatus() {
    switch (this) {
      case 'Published':
        return PackageVersionStatus.published;
      case 'Unfinished':
        return PackageVersionStatus.unfinished;
      case 'Unlisted':
        return PackageVersionStatus.unlisted;
      case 'Archived':
        return PackageVersionStatus.archived;
      case 'Disposed':
        return PackageVersionStatus.disposed;
      case 'Deleted':
        return PackageVersionStatus.deleted;
    }
    throw Exception('$this is not known in enum PackageVersionStatus');
  }
}

/// Details about a package version, including its status, version, and
/// revision. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListPackageVersions.html">
/// <code>ListPackageVersions</code> </a> operation returns a list of
/// <code>PackageVersionSummary</code> objects.
class PackageVersionSummary {
  /// A string that contains the status of the package version. It can be one of
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  final PackageVersionStatus status;

  /// Information about a package version.
  final String version;

  /// The revision associated with a package version.
  final String? revision;

  PackageVersionSummary({
    required this.status,
    required this.version,
    this.revision,
  });
  factory PackageVersionSummary.fromJson(Map<String, dynamic> json) {
    return PackageVersionSummary(
      status: (json['status'] as String).toPackageVersionStatus(),
      version: json['version'] as String,
      revision: json['revision'] as String?,
    );
  }
}

class PutDomainPermissionsPolicyResult {
  /// The resource policy that was set after processing the request.
  final ResourcePolicy? policy;

  PutDomainPermissionsPolicyResult({
    this.policy,
  });
  factory PutDomainPermissionsPolicyResult.fromJson(Map<String, dynamic> json) {
    return PutDomainPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PutRepositoryPermissionsPolicyResult {
  /// The resource policy that was set after processing the request.
  final ResourcePolicy? policy;

  PutRepositoryPermissionsPolicyResult({
    this.policy,
  });
  factory PutRepositoryPermissionsPolicyResult.fromJson(
      Map<String, dynamic> json) {
    return PutRepositoryPermissionsPolicyResult(
      policy: json['policy'] != null
          ? ResourcePolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The details of a repository stored in AWS CodeArtifact. A CodeArtifact
/// repository contains a set of package versions, each of which maps to a set
/// of assets. Repositories are polyglot—a single repository can contain
/// packages of any supported type. Each repository exposes endpoints for
/// fetching and publishing packages using tools like the <code>npm</code> CLI,
/// the Maven CLI (<code>mvn</code>), and <code>pip</code>. You can create up to
/// 100 repositories per AWS account.
class RepositoryDescription {
  /// The 12-digit account number of the AWS account that manages the repository.
  final String? administratorAccount;

  /// The Amazon Resource Name (ARN) of the repository.
  final String? arn;

  /// A text description of the repository.
  final String? description;

  /// The name of the domain that contains the repository.
  final String? domainName;

  /// The 12-digit account number of the AWS account that owns the domain that
  /// contains the repository. It does not include dashes or spaces.
  final String? domainOwner;

  /// An array of external connections associated with the repository.
  final List<RepositoryExternalConnectionInfo>? externalConnections;

  /// The name of the repository.
  final String? name;

  /// A list of upstream repositories to associate with the repository. The order
  /// of the upstream repositories in the list determines their priority order
  /// when AWS CodeArtifact looks for a requested package version. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/codeartifact/latest/ug/repos-upstream.html">Working
  /// with upstream repositories</a>.
  final List<UpstreamRepositoryInfo>? upstreams;

  RepositoryDescription({
    this.administratorAccount,
    this.arn,
    this.description,
    this.domainName,
    this.domainOwner,
    this.externalConnections,
    this.name,
    this.upstreams,
  });
  factory RepositoryDescription.fromJson(Map<String, dynamic> json) {
    return RepositoryDescription(
      administratorAccount: json['administratorAccount'] as String?,
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      externalConnections: (json['externalConnections'] as List?)
          ?.whereNotNull()
          .map((e) => RepositoryExternalConnectionInfo.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      upstreams: (json['upstreams'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UpstreamRepositoryInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the external connection of a repository.
class RepositoryExternalConnectionInfo {
  /// The name of the external connection associated with a repository.
  final String? externalConnectionName;

  /// The package format associated with a repository's external connection. The
  /// valid package formats are:
  ///
  /// <ul>
  /// <li>
  /// <code>npm</code>: A Node Package Manager (npm) package.
  /// </li>
  /// <li>
  /// <code>pypi</code>: A Python Package Index (PyPI) package.
  /// </li>
  /// <li>
  /// <code>maven</code>: A Maven package that contains compiled code in a
  /// distributable format, such as a JAR file.
  /// </li>
  /// <li>
  /// <code>nuget</code>: A NuGet package.
  /// </li>
  /// </ul>
  final PackageFormat? packageFormat;

  /// The status of the external connection of a repository. There is one valid
  /// value, <code>Available</code>.
  final ExternalConnectionStatus? status;

  RepositoryExternalConnectionInfo({
    this.externalConnectionName,
    this.packageFormat,
    this.status,
  });
  factory RepositoryExternalConnectionInfo.fromJson(Map<String, dynamic> json) {
    return RepositoryExternalConnectionInfo(
      externalConnectionName: json['externalConnectionName'] as String?,
      packageFormat: (json['packageFormat'] as String?)?.toPackageFormat(),
      status: (json['status'] as String?)?.toExternalConnectionStatus(),
    );
  }
}

/// Details about a repository, including its Amazon Resource Name (ARN),
/// description, and domain information. The <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_ListRepositories.html">
/// <code>ListRepositories</code> </a> operation returns a list of
/// <code>RepositorySummary</code> objects.
class RepositorySummary {
  /// The AWS account ID that manages the repository.
  final String? administratorAccount;

  /// The ARN of the repository.
  final String? arn;

  /// The description of the repository.
  final String? description;

  /// The name of the domain that contains the repository.
  final String? domainName;

  /// The 12-digit account number of the AWS account that owns the domain. It does
  /// not include dashes or spaces.
  final String? domainOwner;

  /// The name of the repository.
  final String? name;

  RepositorySummary({
    this.administratorAccount,
    this.arn,
    this.description,
    this.domainName,
    this.domainOwner,
    this.name,
  });
  factory RepositorySummary.fromJson(Map<String, dynamic> json) {
    return RepositorySummary(
      administratorAccount: json['administratorAccount'] as String?,
      arn: json['arn'] as String?,
      description: json['description'] as String?,
      domainName: json['domainName'] as String?,
      domainOwner: json['domainOwner'] as String?,
      name: json['name'] as String?,
    );
  }
}

/// An AWS CodeArtifact resource policy that contains a resource ARN, document
/// details, and a revision.
class ResourcePolicy {
  /// The resource policy formatted in JSON.
  final String? document;

  /// The ARN of the resource associated with the resource policy
  final String? resourceArn;

  /// The current revision of the resource policy.
  final String? revision;

  ResourcePolicy({
    this.document,
    this.resourceArn,
    this.revision,
  });
  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      document: json['document'] as String?,
      resourceArn: json['resourceArn'] as String?,
      revision: json['revision'] as String?,
    );
  }
}

/// Contains the revision and status of a package version.
class SuccessfulPackageVersionInfo {
  /// The revision of a package version.
  final String? revision;

  /// The status of a package version. Valid statuses are:
  ///
  /// <ul>
  /// <li>
  /// <code>Published</code>
  /// </li>
  /// <li>
  /// <code>Unfinished</code>
  /// </li>
  /// <li>
  /// <code>Unlisted</code>
  /// </li>
  /// <li>
  /// <code>Archived</code>
  /// </li>
  /// <li>
  /// <code>Disposed</code>
  /// </li>
  /// </ul>
  final PackageVersionStatus? status;

  SuccessfulPackageVersionInfo({
    this.revision,
    this.status,
  });
  factory SuccessfulPackageVersionInfo.fromJson(Map<String, dynamic> json) {
    return SuccessfulPackageVersionInfo(
      revision: json['revision'] as String?,
      status: (json['status'] as String?)?.toPackageVersionStatus(),
    );
  }
}

/// A tag is a key-value pair that can be used to manage, search for, or filter
/// resources in AWS CodeArtifact.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class TagResourceResult {
  TagResourceResult();
  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }
}

class UntagResourceResult {
  UntagResourceResult();
  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }
}

class UpdatePackageVersionsStatusResult {
  /// A list of <code>SuccessfulPackageVersionInfo</code> objects, one for each
  /// package version with a status that successfully updated.
  final Map<String, PackageVersionError>? failedVersions;

  /// A list of <code>PackageVersionError</code> objects, one for each package
  /// version with a status that failed to update.
  final Map<String, SuccessfulPackageVersionInfo>? successfulVersions;

  UpdatePackageVersionsStatusResult({
    this.failedVersions,
    this.successfulVersions,
  });
  factory UpdatePackageVersionsStatusResult.fromJson(
      Map<String, dynamic> json) {
    return UpdatePackageVersionsStatusResult(
      failedVersions: (json['failedVersions'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PackageVersionError.fromJson(e as Map<String, dynamic>))),
      successfulVersions: (json['successfulVersions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              SuccessfulPackageVersionInfo.fromJson(
                  e as Map<String, dynamic>))),
    );
  }
}

class UpdateRepositoryResult {
  /// The updated repository.
  final RepositoryDescription? repository;

  UpdateRepositoryResult({
    this.repository,
  });
  factory UpdateRepositoryResult.fromJson(Map<String, dynamic> json) {
    return UpdateRepositoryResult(
      repository: json['repository'] != null
          ? RepositoryDescription.fromJson(
              json['repository'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about an upstream repository. A list of
/// <code>UpstreamRepository</code> objects is an input parameter to <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_CreateRepository.html">
/// <code>CreateRepository</code> </a> and <a
/// href="https://docs.aws.amazon.com/codeartifact/latest/APIReference/API_UpdateRepository.html">
/// <code>UpdateRepository</code> </a>.
class UpstreamRepository {
  /// The name of an upstream repository.
  final String repositoryName;

  UpstreamRepository({
    required this.repositoryName,
  });
  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    return {
      'repositoryName': repositoryName,
    };
  }
}

/// Information about an upstream repository.
class UpstreamRepositoryInfo {
  /// The name of an upstream repository.
  final String? repositoryName;

  UpstreamRepositoryInfo({
    this.repositoryName,
  });
  factory UpstreamRepositoryInfo.fromJson(Map<String, dynamic> json) {
    return UpstreamRepositoryInfo(
      repositoryName: json['repositoryName'] as String?,
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
