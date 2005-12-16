From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Fri, 16 Dec 2005 10:43:47 +0300
Message-ID: <43A27033.1060109@namesys.com>
References: <1129303303.3370.4.camel@desktop>        <200510142008.42253.vitaly@namesys.com>        <1129484435.16949.1.camel@desktop>        <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>        <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>        <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>        <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>        <f18a8d980512121022j614f431dv62adbbc3caf5a6eb@mail.gmail.com>        <b14e81f00512121415j3c415d45q5cdbeadd149d2eab@mail.gmail.com>       <f18a8d980512121454q5170cc19i31c9aa3d653226fe@mail.gmail.com>    <46071.213.249.155.231.1134648585.squirrel@213.249.155.231>    <43A170D7.1070705@namesys.com> <10772.195.137.105.19.1134678241.squirrel@195.137.105.19>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10772.195.137.105.19.1134678241.squirrel@195.137.105.19>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lordvan@lordvan.com
Cc: reiserfs-list@namesys.com

Hello

Thomas Raschbacher wrote:
> reiserfsck didn't give me any errors:
> 
> desktop Storage3 # reiserfsck usb-reiser3.img
> reiserfsck 3.6.19 (2003 www.namesys.com)
> 
> *************************************************************
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
> 
> Will read-only check consistency of the filesystem on usb-reiser3.img
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
> ###########
> reiserfsck --check started at Thu Dec 15 18:08:00 2005
> ###########
> Replaying journal..
> Reiserfs journal 'usb-reiser3.img' in blocks [18..8211]: 0 transactions
> replayed
> Checking internal tree..finished
> Comparing bitmaps..finished
> Checking Semantic tree:
> finished
> No corruptions found
> There are on the filesystem:
>         Leaves 47328
>         Internal nodes 321
>         Directories 52464
>         Other files 215525
>         Data block pointers 11832978 (1842 of them are zero)
>         Safe links 2
> ###########
> reiserfsck finished at Thu Dec 15 18:16:33 2005
> ###########
> 
> The only tainted kernel module i'm using is the nvidia driver.
> and i'm using many other reiserfs filesystems on my machine root, and ~ 5
> other partitions.
> 
> any idea?
> 

Would you, please, try to mount this filesystem with -o nouser_xattr?

