From: Davide Imbeni <davide.imbeni@tei.ericsson.se>
Subject: Re: Mount fails after reiserfsck --rebuild-tree failure
Date: Mon, 23 Jun 2003 11:28:33 +0200
Message-ID: <3EF6C841.5080106@tei.ericsson.se>
References: <FCEDLNJPOJKGBCPDLKPGGEFMCBAA.g_luppi@brokerstudio.it> <20030620123450.GB24875@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030620123450.GB24875@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: davide.imbeni@tiscali.it, reiserfs-list@namesys.com

Hi Oleg,


Oleg Drokin wrote:

> This is not possible in your case, I'd say.
> What you can do - is you can copy entire block device to a file/another device
> and run rebuild-tree there. Use dd_rescue for copying.

I did as you suggested, and it worked fine.

Thank you VERY much for the timely advice!

BR

Davide


-- 
Davide Imbeni
Research Engineer

Ericsson Telecomunicazioni S.p.A.
Radio Network System Management
via Pio La Torre, 14/C
I-20090 Vimodrone
Milano - Italy

Tel: +39 02 26594 692 / +39 051 6115 329
Fax: +39 02 26594 635

Davide.Imbeni@tei.ericsson.se
www.ericsson.com

