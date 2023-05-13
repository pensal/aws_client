# AWS API client for Amazon Interactive Video Service

**Generated Dart library from API specification**

*About the service:*
<b>Introduction</b>

The Amazon Interactive Video Service (IVS) API is REST compatible, using a
standard HTTP API and an <a href="https://aws.amazon.com/sns">AWS SNS</a>
event stream for responses. JSON is used for both requests and responses,
including errors.

The API is an AWS regional service, currently in these regions: us-west-2,
us-east-1, and eu-west-1.

<i> <b>All API request parameters and URLs are case sensitive. </b> </i>

For a summary of notable documentation changes in each release, see <a
href="https://docs.aws.amazon.com/ivs/latest/userguide/doc-history.html">
Document History</a>.

<b>Service Endpoints</b>

The following are the Amazon IVS service endpoints (all HTTPS):

Region name: US West (Oregon)

<ul>
<li>
Region: <code>us-west-2</code>
</li>
<li>
Endpoint: <code>ivs.us-west-2.amazonaws.com</code>
</li>
</ul>
Region name: US East (Virginia)

<ul>
<li>
Region: <code>us-east-1</code>
</li>
<li>
Endpoint: <code>ivs.us-east-1.amazonaws.com</code>
</li>
</ul>
Region name: EU West (Dublin)

<ul>
<li>
Region: <code>eu-west-1</code>
</li>
<li>
Endpoint: <code>ivs.eu-west-1.amazonaws.com</code>
</li>
</ul>
<b>Allowed Header Values</b>

<ul>
<li>
<code> <b>Accept:</b> </code> application/json
</li>
<li>
<code> <b>Accept-Encoding:</b> </code> gzip, deflate
</li>
<li>
<code> <b>Content-Type:</b> </code>application/json
</li>
</ul>
<b>Resources</b>

The following resources contain information about your IVS live stream (see
<a href="https://docs.aws.amazon.com/ivs/latest/userguide/GSIVS.html">
Getting Started with Amazon IVS</a>):

<ul>
<li>
Channel — Stores configuration data related to your live stream. You first
create a channel and then use the channel’s stream key to start your live
stream. See the Channel endpoints for more information.
</li>
<li>
Stream key — An identifier assigned by Amazon IVS when you create a channel,
which is then used to authorize streaming. See the StreamKey endpoints for
more information. <i> <b>Treat the stream key like a secret, since it allows
anyone to stream to the channel.</b> </i>
</li>
<li>
Playback key pair — Video playback may be restricted using
playback-authorization tokens, which use public-key encryption. A playback
key pair is the public-private pair of keys used to sign and validate the
playback-authorization token. See the PlaybackKeyPair endpoints for more
information.
</li>
</ul>
<b>Tagging</b>

A <i>tag</i> is a metadata label that you assign to an AWS resource. A tag
comprises a <i>key</i> and a <i>value</i>, both set by you. For example, you
might set a tag as <code>topic:nature</code> to label a particular video
category. See <a
href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
AWS Resources</a> for more information, including restrictions that apply to
tags.

Tags can help you identify and organize your AWS resources. For example, you
can use the same tag for different resources to indicate that they are
related. You can also use tags to manage access (see <a
href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">
Access Tags</a>).

The Amazon IVS API has these tag-related endpoints: <a>TagResource</a>,
<a>UntagResource</a>, and <a>ListTagsForResource</a>. The following
resources support tagging: Channels, Stream Keys, and Playback Key Pairs.

<b>Channel Endpoints</b>

<ul>
<li>
<a>CreateChannel</a> — Creates a new channel and an associated stream key to
start streaming.
</li>
<li>
<a>GetChannel</a> — Gets the channel configuration for the specified channel
ARN (Amazon Resource Name).
</li>
<li>
<a>BatchGetChannel</a> — Performs <a>GetChannel</a> on multiple ARNs
simultaneously.
</li>
<li>
<a>ListChannels</a> — Gets summary information about all channels in your
account, in the AWS region where the API request is processed. This list can
be filtered to match a specified string.
</li>
<li>
<a>UpdateChannel</a> — Updates a channel's configuration. This does not
affect an ongoing stream of this channel. You must stop and restart the
stream for the changes to take effect.
</li>
<li>
<a>DeleteChannel</a> — Deletes the specified channel.
</li>
</ul>
<b>StreamKey Endpoints</b>

<ul>
<li>
<a>CreateStreamKey</a> — Creates a stream key, used to initiate a stream,
for the specified channel ARN.
</li>
<li>
<a>GetStreamKey</a> — Gets stream key information for the specified ARN.
</li>
<li>
<a>BatchGetStreamKey</a> — Performs <a>GetStreamKey</a> on multiple ARNs
simultaneously.
</li>
<li>
<a>ListStreamKeys</a> — Gets summary information about stream keys for the
specified channel.
</li>
<li>
<a>DeleteStreamKey</a> — Deletes the stream key for the specified ARN, so it
can no longer be used to stream.
</li>
</ul>
<b>Stream Endpoints</b>

<ul>
<li>
<a>GetStream</a> — Gets information about the active (live) stream on a
specified channel.
</li>
<li>
<a>ListStreams</a> — Gets summary information about live streams in your
account, in the AWS region where the API request is processed.
</li>
<li>
<a>StopStream</a> — Disconnects the incoming RTMPS stream for the specified
channel. Can be used in conjunction with <a>DeleteStreamKey</a> to prevent
further streaming to a channel.
</li>
<li>
<a>PutMetadata</a> — Inserts metadata into an RTMPS stream for the specified
channel. A maximum of 5 requests per second per channel is allowed, each
with a maximum 1KB payload.
</li>
</ul>
<b>PlaybackKeyPair Endpoints</b>

<ul>
<li>
<a>ImportPlaybackKeyPair</a> — Imports the public portion of a new key pair
and returns its <code>arn</code> and <code>fingerprint</code>. The
<code>privateKey</code> can then be used to generate viewer authorization
tokens, to grant viewers access to authorized channels.
</li>
<li>
<a>GetPlaybackKeyPair</a> — Gets a specified playback authorization key pair
and returns the <code>arn</code> and <code>fingerprint</code>. The
<code>privateKey</code> held by the caller can be used to generate viewer
authorization tokens, to grant viewers access to authorized channels.
</li>
<li>
<a>ListPlaybackKeyPairs</a> — Gets summary information about playback key
pairs.
</li>
<li>
<a>DeletePlaybackKeyPair</a> — Deletes a specified authorization key pair.
This invalidates future viewer tokens generated using the key pair’s
<code>privateKey</code>.
</li>
</ul>
<b>AWS Tags Endpoints</b>

<ul>
<li>
<a>TagResource</a> — Adds or updates tags for the AWS resource with the
specified ARN.
</li>
<li>
<a>UntagResource</a> — Removes tags from the resource with the specified
ARN.
</li>
<li>
<a>ListTagsForResource</a> — Gets information about AWS tags for the
specified ARN.
</li>
</ul>

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
