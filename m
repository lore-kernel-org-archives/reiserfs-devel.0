From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Yet another reiserfs<dm<md corruption
Date: Wed, 13 Apr 2005 00:48:04 +0400
Message-ID: <425C3404.1090609@namesys.com>
References: <1113156285.4681.7.camel@localhost>	 <425ABC1C.2030001@namesys.com> <1113246505.4614.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23858-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1113246505.4614.9.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jzobel@heute-morgen.de
Cc: reiserfs-list@namesys.com

Hello.

Joachim Zobel wrote:

>Am Montag, den 11.04.2005, 22:04 +0400 schrieb E.Gryaznova:
>
>  
>
>>Would you please send the following commands outputs?:
>># dmsetup deps
>># dmsetup status
>># dmsetup info
>># pvdisplay --map
>># lvdisplay --map -vv
>>
>>
>># ls -l /dev/vg (and /dev/mapper)
>>
>>    
>>
>
>See the attached file reiserfs.log
>
>The devices 
>volg2-logv4: 1 dependencies     : (22, 3)
>volg2-logv3: 1 dependencies     : (22, 3)
>volg2-logv2: 1 dependencies     : (22, 3)
>where created after the incident. 
>One of them had a successful (some files lost) reiserfsck --rebuild-tree
>after dd-ing the bad /dev/volg-raid1/logv1 on it. 
>
>lvdisplay --map -v did some stderr output, which is attached as
>lvdisplay.err
>
>#cat /proc/mdstat
>Personalities : [raid1]
>md0 : active raid1 hda2[0] hdc2[1]
>      3903680 blocks [2/2] [UU]
>
>Sincerely,
>Joachim
>  
>

I have checked lvm, it looks ok. Probably this is hardware problem.
If you need our  assistance in further investigation, please visit our 
support page http://www.namesys.com/support.html .

Thanks,
Lena





