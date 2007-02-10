From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: [patch] reiser4-for-2.6.20
Date: Sat, 10 Feb 2007 16:09:00 +0100
Message-ID: <20070210150900.GA8973@efil.de>
References: <20070205030106.GA10122@efil.de> <8898527.post@talk.nabble.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <8898527.post@talk.nabble.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 2007-02-09 23:26, squadra wrote:
> i m getting lots of errormessages with the 2.6.20 patch, it looks to me like
> they start when i copy files from  a reiser4 partition, to a ext3.

Hi, thanks for your report. 

* Did you use 2.6.19 on that machine before? Any problems with it?
* Do you use reiser4 cryptocmpress?

I'm running two system using my original 2.6.20-patch.
There wasn't a single problem (even under heavy io).

I just created an ext3 partition and filled it up with files from reiser4.
What did you actually do to trigger the errors? Cryptocompress? 


Ingo

-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

