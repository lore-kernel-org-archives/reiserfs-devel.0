From: Christian Mayrhuber <christian.mayrhuber+mailinglisten.reiserfs@osiris.at>
Subject: Re: Re: [NFS] NFS/2.4.18/reiserfs question
Date: Thu, 12 Sep 2002 10:03:02 +0200
Message-ID: <3D804A36.3060509@osiris.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Troy Wu wrote:


>>I've gotten some very helpful information, but am still a little confused.
>>Basically, I've heard some people say that Reiser (RFS) is simply a bad
>>choice with NFS.  Others have said I'm using the wrong version of the
>>on-disk format.  I've also been reading up on the discussion at the
>>ReiserFS archives about this.
>>
>>Am I to understand that RFS-3.5.x does not reliably work with NFS (because
>>of the stale filehandle problem caused by a weird inode generation
>>implementation)?  I'm not convinced that RFS-3.6.x will fix the problem.
>>
>>	Basically, does RFS-3.6.x *fix* this problem or simply *mitigate*
>>	this problem?
>>
>>	Secondly, even though I acknowlege that NFS is a bit lame,
>>	filesystem support is still critical to many operations (including
>>	ours).  We have terabytes of data, and copying files to move them
>>	to a new file format (which in this case seems necessary), is not
>>	something that we can do at the drop of a hat.  I understand it's
>>	my failing not to have checked this before using RFS, but can
>>	someone provide an objective picture of how seriously
>>	production-ready RFS/NFS is?
>>
>>Can anyone point me to the actual references which describe this problem
>>(i.e., the inode numbers or file-handles and how they relate to NFS and
>>Reiser interacting badly)?  Or, if you're so inclined, to share that
>>information via email?  =)
>>
>>
>  
>
 From my point of view Reiserfs and nfs is rather stable. We did not 
have any problems
with nfs and reiserfs kernel 2.4.18 at our company. Sure, we don't have 
TBytes of Data
shared with nfs, but our GBytes perform very well, with no problems 
related to reiserfs.
We are using RFS-3.6.x on disk format, to have files > 2GB available.
If you have no need for using kernel 2.2.x you can easily convert 
reiserfs to 3.6.x
format if you pass the option "conv" once during filesystem mount, there 
is no need
for copying your TBytes.

NFS seems to be a bit problematic with some applications, because it 
does not
gurantee locking in the same way as disk fs do. For ex. the cyrus imap 
server will
not work over nfs. We've got nfs problems on some clients, if the 
clients kernel
had a different version number than the server, but this appeared also 
with ext3 nfs exports.
Upgrading the clients to kernel 2.4.18 fixed it.

-- WfG, Christian Mayrhuber



