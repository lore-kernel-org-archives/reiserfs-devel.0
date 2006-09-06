From: Joe Feise <jfeise@feise.com>
Subject: Re: Better fsck.reiser4 needed
Date: Wed, 06 Sep 2006 07:36:45 -0700
Message-ID: <44FEDCFD.5010703@feise.com>
References: <44FE8041.5060403@feise.com> <200609061304.30625.vs@namesys.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609061304.30625.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote on 09/06/06 02:04:

>> I had a /var corruption (reiser4 on /var) over the weekend, and since I was
>> out of town, the machine was hanging trying to go into multi-user mode 
> 
> I guess here you got reiser4 bug where it hanged trying to access corrupted 
> partition instead of returning -EIO. Was there anything interesting in logs 
> and have you managed to catch them?


Unfortunately, I didn't get any logs, since they are on the corrupted /var.

-Joe

