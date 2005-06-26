From: randy_dunlap <rdunlap@xenotime.net>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 11:14:35 -0700
Message-ID: <20050626111435.6c5d54c8.rdunlap@xenotime.net>
References: <20050620235458.5b437274.akpm@osdl.org>
	<42B8B9EE.7020002@namesys.com>
	<42B8BB5E.8090008@pobox.com>
	<200506221824.32995.zam@namesys.com>
	<20050622142947.GA26993@infradead.org>
	<42BA2ED5.6040309@namesys.com>
	<20050626164606.GA18942@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050626164606.GA18942@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: reiser@namesys.com, zam@namesys.com, jgarzik@pobox.com, reiserfs-list@namesys.com, akpm@osdl.org, linux-kernel@vger.kernel.org

On Sun, 26 Jun 2005 17:46:06 +0100 Christoph Hellwig wrote:

| On Wed, Jun 22, 2005 at 08:39:01PM -0700, Hans Reiser wrote:
| > Correct me if I am wrong:
| > 
| > What exists currently in VFS are vector instances, not classes. Plugins,
| > selected by pluginids, are vector classes, with each pluginid selecting
| > a vector class. You propose to have the vector class layer (aka plugin
| > layer) in reiser4 export the vector instance to VFS for VFS to handle
| > for each object, rather than having VFS select reiser4 and reiser4
| > selecting a vector class (aka plugin) which selects a method.
| > 
| > If we agree on the above, then I will comment further.
| 
| I'm a bit confused about what you're saying here.  What does the 'vector'
| in all these expressions mean?
| 
| In OO terminology our *_operation structures are interfaces.  Each particular
| instance of such a struct that is filled with function pointers is a class.
| Each instance of an inode/file/dentry/superblock/... that uses these operation
| vectors is an object.
| 
| What I propose (or rather demand ;-)) is that you don't duplicate this
| infrastructure, and add another dispath layer below these objects but instead
| re-use it for what it is done and only handle things specific to reiser4
| in your own code. 

I think that what Hans is trying to say is that the functionality
that is handled by plugin_operations are a different dimension or
vector from the inode/file/dentry etc. operations.
Whether he is right or not is part of the discussion.
and "plugin" is a bad name :(

Is part of the problem that plugins are too extensible?
I.e., the plugin_operations methods can do almost anything?

I would want to see a list of methods that should be supported and then
a reasonable infrastructure for supporting those.
Pick one (like metadata) and drill down on how to support that.

---
~Randy
