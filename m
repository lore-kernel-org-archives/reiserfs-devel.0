From: Lars Wolff <support@sipex.de>
Subject: Re: Try to fix a  broken ReiserFS / Data Recovering?
Date: Tue, 20 Jun 2006 12:14:15 +0200
Message-ID: <4497CA77.7000108@sipex.de>
References: <44966E34.7040801@sipex.de> <1150720072.6383.88.camel@tribesman.namesys.com> <44969FFF.5010601@sipex.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44969FFF.5010601@sipex.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi List, hi Vladimir!

>>> _My Questions_
>>> - Am i right in doing these actions to try to resolve the problem of 
>>> my harddisk, and HOPEFULLY to recover the Data?
>>>
>> after dd_rescue completes - please run reiserfsck (3.6.19, without any
>> options but filename) on backup image and let us know what it says.
> 
> i did i as explained here:
> http://martian.org/marty/2003/09/05/reiserfs-filesystem-recovery

Yesterday night reiserfsck finished up "clear" and i could mount the 
dd_rescue_imag on a loopdevice and at least to the filesystem :))))

I took the whole night to copy all data, but i alreade found everthing, 
i also got some files in "lost+found" and have to check this manually.

Do Somebody now a easy way to work with the lost+found files? 
(XXXXX_yyyyy X=inode right?)

Lars
