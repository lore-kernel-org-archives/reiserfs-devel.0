From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:37:06 +0100
Message-ID: <3E5F6602.3060902@mb.tu-ilmenau.de>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <3E5F5C64.7080408@namesys.com> <20030228135754.G24291@humilis> <200302281501.43228.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 02/28/2003 02:01 PM, Voicu Liviu wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Friday 28 February 2003 14:57, Ookhoi wrote:
> 
>>Hans Reiser wrote (ao):
>>
>>>>PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>>>>889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
>>>>890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
>>>>845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
>>>
>>>Voicu, I think you have your nice directions confused, and you want to
>>>nice your compile to +10 not -10.  Probably Unix should reverse the
>>>directions, but....
>>
>>I believe he wants to speed up the compile, for which -10 is ok if there
>>are other processes which need cpu cycles.
> 
> 
> Corect, I use X and vmware and JBuilder and XFCE4 so I can renice each 1 I 
> want....

When using that setup _including VMware_ you simply should not renice 
"each process you want".

Especially VMware (What version?!) remains on disk, transfers from & to 
disk /tmp/ram0 (e.g) and consumes much of CPU-time what is very complex 
to control via nice (in relation to other processes).

Just my experience, best regards,

Manuel

