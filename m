From: Oleg Drokin <green@namesys.com>
Subject: Re: [Fwd: Re: [reiserfs-list] Desaster Reiser]
Date: Fri, 6 Sep 2002 14:22:05 +0400
Message-ID: <20020906142205.A14161@namesys.com>
References: <3D78D3B3.8D524FC1@tridentemonigotes.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D78D3B3.8D524FC1@tridentemonigotes.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jose@tridentemonigotes.com
Cc: reiser <reiserfs-list@namesys.com>

Hello!

On Fri, Sep 06, 2002 at 12:11:31PM -0400, jose@tridentemonigotes.com wrote:

> [-- Attachment #2: hdb2.gz --]
> [-- Type: application/x-gzip, Encoding: base64, Size: 4.7M --]

I am sorry, but I am unable to unpack this metadata snapshot.
I am getting 'unknown magic' message.
How did you compiled your reiserfsprogs?
Can you recompile from scratch please? (with make distclean executed
if doing this from already compiled tree).
Also please verify you can unpack these yourself:
on non-reiserfs fs! (this is important, if all of your FSs are reiserfs do not
do it then)
execute this commands:
touch /nonreiserfs_fs/image
zcat /path/metadata.gz | unpack /nonreiserfs_fs/image

It should print something like this:
<-------------unpack, 2002------------->
reiserfsprogs 3.6.3

There were 5046410 blocks on the device
...#############################################################################
[many lines filled with this]
Unpacked XXX leaves, XXX full blocks
Temp file opened by fsck: ".bitmap" ..

Bye,
    Oleg
