From: Alain Knaff <alain@knaff.lu>
Subject: Re: fatal "not directory found" error at pass 3a of reiserfsck
Date: Tue, 14 Mar 2006 20:35:59 +0100
Message-ID: <44171B1F.5070809@knaff.lu>
References: <4416E66D.4020500@knaff.lu> <200603142220.39344.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603142220.39344.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> Hi Alain,
> 
> the fixed reiserfsprogs version is attched, it contains 
> some bugfixes, please run it and report about the result.
> 
> Thank you.

Actually, the problem happened with reiserfs-3.6.18-5 (as shipped by 
SuSE 9.3. and 10.0.).

Later, I downloaded 3.6.19 from namesys, and that one already 
successfully restored the disk (but due to size and slowness of our 
hardware this took several hours and terminated just now a quarter of an 
hour ago).

Now, we'll first do a backup (yeah, we learned that lesson!), and after 
that I'll re-run your 3.6.20 and report back (will probably take until 
next morning, though)

Thanks,

Alain
