From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: repacker ?
Date: Tue, 21 Sep 2004 22:36:55 +0800 (HKT)
Message-ID: <2760.192.168.0.27.1095777415.squirrel@sml.dyndns.org>
References: <2487.192.168.0.27.1095730569.squirrel@sml.dyndns.org>
    <20040921112742.GB5137@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-21862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040921112742.GB5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

OK
so I don't need to run repacker all the time?


> On Tue, Sep 21, 2004 at 09:36:09AM +0800, Thomas Graham wrote:
>> hey all, I might miss some of the info, what is echo 1 > .../direction
>> use
>> for ? I know echo 1 for repacker, but what is direction ? Thanks.
>
> the repacker scans whole reiser4 internal tree and repacks/relocates
> nodes.
> ".../direction" controls whether the repacker scans the tree forward (from
> smallest key to the biggest one, direction=0) or backward (direction=1).
>
> see also http://namesys.com/v4/v4.html#repacker
>
>> --
>> HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
>> Phone number: 852-93239670    (24hours a day, 7days a week non-stop
>> phone)
>> Web site: http://sml.dyndns.org
>> Email: lkthomas@sml.dyndns.org
>
> --
> Alex.
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
