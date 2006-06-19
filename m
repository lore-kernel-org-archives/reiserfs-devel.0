From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Try to fix a  broken ReiserFS / Data Recovering?
Date: Mon, 19 Jun 2006 16:27:52 +0400
Message-ID: <1150720072.6383.88.camel@tribesman.namesys.com>
References: <44966E34.7040801@sipex.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44966E34.7040801@sipex.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lars Wolff <support@sipex.de>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-06-19 at 11:28 +0200, Lars Wolff wrote:
> Hi there,
> 
> i am very new to this list, i just signed up today, because i got some 
> problems with a broken ReiserFS since yesterday.
> 
> _The problem_
> Yesterday my Router/Server (Suse Linux 8.1, 40GB IDE HDD with ReiserFS) 
> hang up. After a reboot it only starts to "load stage2 of Grub", which 
> fails and ends up in the grub minimal bash.
> 
> _What i do to resolve the problem_
> I downloaded the Suse Live-CD 9.1 and did a clean boot from it. I Try to 
> mount the volume, what end up with "Falscher Dateisystemtyp, ungültige 
> Optionen, der »Superblock« von /dev/hdb2 ist beschädigt oder es sind
> zu viele Dateisysteme eingehängt" (=corrupt superblock)
> 
> Then I tried reiserFs Check wich ends up in: Bad root block 0. 
> (--rebuild-tree did not complete).
> 
> Ok, i followed the instructions in the following "bad block info text" 
> and did a reiserFs -B badblocksfile --rebuild-tree. Wich aborts and said 
> "badblock in ....".
> 
> Right now i am doing a complete Backup image with dd_rescue, after this 
> i would like to run /sbin/badblocks, as explained in the Faq 
> (http://www.namesys.com/bad-block-handling.html) and run then reiserfs 
> -B again.
> 
> _My Questions_
> - Am i right in doing these actions to try to resolve the problem of my 
> harddisk, and HOPEFULLY to recover the Data?
> 

after dd_rescue completes - please run reiserfsck (3.6.19, without any
options but filename) on backup image and let us know what it says.

> - Is there anything i should try/do else?
> 
> - Do you now somebody/any company, wich do a real data-recovering von 
> ReiserFS Disk? Its only 40GB but there are some data on it wich are very 
> important. (don't ask after the backups, they broke last week on the 
> extern hdd! :(( )
> 
> Hopefully you guys can help me,
> thanks a lot!!!! :)
> 
> Lars
> 

