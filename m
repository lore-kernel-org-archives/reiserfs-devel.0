From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs v3 patches updated
Date: Tue, 06 Apr 2004 17:39:12 -0400
Message-ID: <1081287552.30828.300.camel@watt.suse.com>
References: <1081210239.4994.69.camel@watt.suse.com>
	 <200404061838.05099.christian.mayrhuber@gmx.net>
	 <4072F6F1.3090806@mweb.co.za> <1081277245.30813.81.camel@watt.suse.com>
	 <4073022E.3090100@mweb.co.za> <1081279465.30829.128.camel@watt.suse.com>
	 <40730ABD.3070507@mweb.co.za> <1081283607.30811.206.camel@watt.suse.com>
	 <4073186C.3010601@mweb.co.za> <1081285851.30813.269.camel@watt.suse.com>
	 <40732185.8060303@mweb.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40732185.8060303@mweb.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cami <camis@mweb.co.za>
Cc: reiserfs-list@namesys.com

On Tue, 2004-04-06 at 17:30, Cami wrote:
> >>>I'm a little slow today.  data=ordered is the default with these
> >>>patches.  You need to mount -o data=writeback.

> Hrmph! Its not going above 0.8% iowait.. it hangs around the 0.0% ->
> 0.04% mark.. Looks good, thanks.. ;)

Great to hear, thanks for getting me to look at this.

-chris


