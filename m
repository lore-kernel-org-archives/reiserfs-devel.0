From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: udpated data logging available
Date: Thu, 26 Jun 2003 02:16:41 +0200
Message-ID: <200306260216.41204.christian.mayrhuber@gmx.net>
References: <1055764071.24111.650.camel@tiny.suse.com> <200306231853.04098.christian.mayrhuber@gmx.net> <1056568529.10097.135.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056568529.10097.135.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Mittwoch, 25. Juni 2003 21:15 schrieb Chris Mason:
> Thanks for giving things a try.  I just uploaded io-stalls-7.diff, which
> should do better at fixing latency during heavy io.
>
> -chris

My feeling is that io-stalls-6 is where standard 2.4.21 was if it comes down to latency.
But io-stalls-7 makes a big improvement for me during heavy io. The directory listing
in Konqueror, including image preview, appears nearly immedeately even during heavy io. 

Great work! Thanks.
-- 
lg, Chris

