From: "D.A.M. Revok" <marvin@synapse.net>
Subject: Re: bug report: attributes ( chattr +a ) not respected by reiserfs 3.6, but this isn't listed in man mkreiserfs
Date: Wed, 16 Jul 2003 10:57:03 -0400
Message-ID: <200307161057.03293.marvin@synapse.net>
References: <200307121010.07215.marvin@synapse.net> <200307151510.55763.marvin@synapse.net> <20030716103016.GA4955@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030716103016.GA4955@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, feedback@suse.com, reiserfs-list@namesys.com

Hello yerself!

I tried it with 'mount' rather than 'mount -o remount' and ...
... no difference.

AND I've 'grepped -i ' for reiserfs in /var/log/*
... no errors.

I'll have to try the reiserfsck --clean-attributes trick, next...


On 2003-Jul-16, Wed 6h30, you wrote:
>Hello!
>
>   I suggest you to mount with -o attrs (not remount) also look in the
> kernel logs for any problems, there is a requirement that before you
> have attrs code working, you need to have special flag in superblock
> set (which you can set with reiserfsck --clean-attributes)
>
>Bye,
>    Oleg
>
>On Tue, Jul 15, 2003 at 03:10:55PM -0400, D.A.M. Revok wrote:
>> I was absolutely stunned that reiserfs would throw-away attributes
>> /by default/ but possibly it could know them?
>> So, I tried
>> su
>> 	mount -o remount,attrs /mnt/md1
>> exit
>> echo "this and that" > test
>> su
>> 	chattr +a test
>> 	lsattr test		# *same as before*, it lists the attribute
>> exit
>> cp /dev/null test
>> ls -l test			# answer is size==0
>>
>> So now ( now that I found your e-mail in all these damn spams! )
>> I know that it doesn't respect attributes normally, or with the
>> mount -o attrs
>> option.
>>
>> It /shows/ that it respects attributes, but they don't /change
>> anything/ and that is a problem.
>>
>> Append-only logs work in ext3, but not with reiserfs.
>>
>> On 2003-Jul-13, Sun 9h10, you wrote:
>> >Hello!
>> >
>> >On Sat, Jul 12, 2003 at 10:10:07AM -0400, D.A.M. Revok wrote:
>> >> Please declare this in man .*reiser.*
>> >> ( and also in the --help listings for 'em ), since it is kind of
>> >> important to know *when* one is setting-up a filesystem
>> >> ( rather than after the system's been built... )
>> >> so that no others will try setting
>> >> chattr +a logfile
>> >> to make it append-only, as part of system-security, because the
>> >> attribute set is non-meaningful.  ext3 respects this attribute.
>> >> This on SuSE 8.1 Pro and 8.2 Pro's kernel, maybe the stock kernel
>> >> has it working, but I figure it'd be better to tell you people and
>> >> let youse sort-it-out.
>> >
>> >How do you tell it is not meaningful? Hve you tried to
>> >mount with -o attrs mount option?
>> >
>> >Bye,
>> >    Oleg
>>
>> --
>> http://www.drawright.com/
>>  - "The New Drawing on the Right Side of the Brain" ( Betty Edwards,
>> check "Theory", "Gallery", and "Exercises" )
>> http://www.ldonline.org/ld_indepth/iep/seven_habits.html
>>  - "The 7 Habits of Highly Effective People" ( this site is same
>> principles as Covey's book )
>> http://www.eiconsortium.org/research/ei_theory_performance.htm
>>  - "Working With Emotional Intelligence" ( Goleman: this link is
>> /revised/ theory, "Working. . . " is practical )
>> http://www.leadershipnow.com/leadershop/1978-5.html
>>  - Corps Business: The 30 /Management Principles/ of the U.S. Marines
>> ( David Freedman )

-- 
http://www.drawright.com/
 - "The New Drawing on the Right Side of the Brain" ( Betty Edwards, 
check "Theory", "Gallery", and "Exercises" )
http://www.ldonline.org/ld_indepth/iep/seven_habits.html
 - "The 7 Habits of Highly Effective People" ( this site is same 
principles as Covey's book )
http://www.eiconsortium.org/research/ei_theory_performance.htm
 - "Working With Emotional Intelligence" ( Goleman: this link is 
/revised/ theory, "Working. . . " is practical )
http://www.leadershipnow.com/leadershop/1978-5.html
 - Corps Business: The 30 /Management Principles/ of the U.S. Marines ( 
David Freedman )
