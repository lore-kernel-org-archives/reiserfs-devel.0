From: Lars Wolff <support@sipex.de>
Subject: Re: Try to fix a  broken ReiserFS / Data Recovering?
Date: Mon, 19 Jun 2006 15:00:47 +0200
Message-ID: <44969FFF.5010601@sipex.de>
References: <44966E34.7040801@sipex.de> <1150720072.6383.88.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1150720072.6383.88.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi Vladimir!

Thanks for your Reply!!!

>> _My Questions_
>> - Am i right in doing these actions to try to resolve the problem of my 
>> harddisk, and HOPEFULLY to recover the Data?
>>
> after dd_rescue completes - please run reiserfsck (3.6.19, without any
> options but filename) on backup image and let us know what it says.

i did i as explained here:
http://martian.org/marty/2003/09/05/reiserfs-filesystem-recovery

- dd_rescue finished
- i set up a loop device with the image
- then i start reiserfsck --check, it breaks up with rebuild-tree not 
finished
- then i start reiserfsck with --rebuild-tree
- and now its at pass 3 (and in pass 2 i saw the most importatn 
directory's and files i need)

i am still wating and have always a look on the screen ;)

further infos in a few minutes

thanks & take care!
Lars

