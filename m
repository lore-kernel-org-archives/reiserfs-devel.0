From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: kmail crash, reiser4 errors
Date: Thu, 23 Sep 2004 17:43:38 +0400
Message-ID: <1095947018.6117.27.camel@tribesman.namesys.com>
References: <200409230943.14710.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409230943.14710.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-09-23 at 10:43, Raymond A. Meijer wrote:
> Hello,
> 
> Yesterday afternoon kmail crashed unexpectedly:
> 
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: extent2tail (fs/reiser4/plugin/file/tail_conversion.c:654)[nikita-2282]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Partial conversion of 280274: 0 of 1: -28
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: release_unix_file (fs/reiser4/plugin/file/file.c:2109)[nikita-3233]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Failed to convert in release_unix_file (280274)
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: extent2tail (fs/reiser4/plugin/file/tail_conversion.c:654)[nikita-2282]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Partial conversion of 91692: 0 of 1: -28
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: release_unix_file (fs/reiser4/plugin/file/file.c:2109)[nikita-3233]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Failed to convert in release_unix_file (91692)
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: extent2tail (fs/reiser4/plugin/file/tail_conversion.c:654)[nikita-2282]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Partial conversion of 294037: 0 of 1: -28
> Sep 22 14:12:14 rmeijer-noc kernel: reiser4[kmail(4826)]: release_unix_file (fs/reiser4/plugin/file/file.c:2109)[nikita-3233]:
> Sep 22 14:12:14 rmeijer-noc kernel: WARNING: Failed to convert in release_unix_file (294037)
> 
> Do I need to run an fsck on that partition now?
> 

No. You may want to free some disk space, though.

> I'm running kernel 2.6.8.1-cko7.
> 
> 
> Thanks,
> 
> Ray
> 

