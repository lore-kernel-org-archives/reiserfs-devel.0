From: Avuton Olrich <avuton@gmail.com>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Tue, 22 Nov 2005 11:27:58 -0800
Message-ID: <3aa654a40511221127x68d059c5hfdfd4254aec0e1b5@mail.gmail.com>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com> <200511172040.39955.mail@earthworm.de>
	 <43820CAD.3090605@namesys.com> <20051121210136.GA25708@favonius>
	 <4383677F.8060106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4383677F.8060106@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: sander@humilis.net, "Hesse, Christian" <mail@earthworm.de>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 11/22/05, E.Gryaznova <grev@namesys.com> wrote:
> Sander wrote:
>
> >E.Gryaznova wrote (ao):
> Something like
> for i in cfq noop anticipatory deadline
> do
>   echo $i > /sys/block/hda/queue/scheduler && cat
> /sys/block/hda/queue/scheduler && echo "foo" >/root/test && time vim +"s/
> foo/bar/" +"wq" /root/test
> done

Done, I had to output to vim's output to /dev/null due to it clearing the t=
erm.

for i in cfq noop anticipatory deadline
do
echo $i  > /sys/block/hda/queue/scheduler
cat /sys/block/hda/queue/scheduler
echo "foo" > /root/test; time vim +"s/foo/bar/" +"wq" /root/test>/dev/null
done

Results:
noop anticipatory deadline [cfq]
Vim: Warning: Output is not to a terminal

real=090m2.464s
user=090m0.046s
sys=090m0.022s
[noop] anticipatory deadline cfq
Vim: Warning: Output is not to a terminal

real=090m2.188s
user=090m0.045s
sys=090m0.018s
noop [anticipatory] deadline cfq
Vim: Warning: Output is not to a terminal

real=090m2.213s
user=090m0.044s
sys=090m0.021s
noop anticipatory [deadline] cfq
Vim: Warning: Output is not to a terminal

real=090m2.422s
user=090m0.046s
sys=090m0.018s

Linux rocket 2.6.15-rc1-mm2 #6 SMP PREEMPT Tue Nov 22 11:02:59 PST
2005 x86_64 AMD Athlon(tm) 64 X2 Dual Core Processor 4200+
AuthenticAMD GNU/Linux
--
  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
