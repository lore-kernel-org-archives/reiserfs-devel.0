From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: repacker ?
Date: Tue, 21 Sep 2004 15:27:43 +0400
Message-ID: <20040921112742.GB5137@backtop.namesys.com>
References: <2487.192.168.0.27.1095730569.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <2487.192.168.0.27.1095730569.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

On Tue, Sep 21, 2004 at 09:36:09AM +0800, Thomas Graham wrote:
> hey all, I might miss some of the info, what is echo 1 > .../direction use
> for ? I know echo 1 for repacker, but what is direction ? Thanks.

the repacker scans whole reiser4 internal tree and repacks/relocates nodes.
".../direction" controls whether the repacker scans the tree forward (from
smallest key to the biggest one, direction=0) or backward (direction=1).

see also http://namesys.com/v4/v4.html#repacker

> -- 
> HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
> Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
> Web site: http://sml.dyndns.org
> Email: lkthomas@sml.dyndns.org

-- 
Alex.
