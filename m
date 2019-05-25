From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: bug#22113: PATCH: Updated Reiser4 probe enabled against GNU Parted
	git://git.sv.gnu.org/parted.git
Date: Sat, 25 May 2019 22:25:21 +0200
Message-ID: <d2e77dc5-87b5-fe58-ec1e-7df633d83620@gmail.com>
References: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org>
Sender: "Debbugs-submit" <debbugs-submit-bounces@debbugs.gnu.org>
Resent-Message-ID: <handler.22113.B22113.15588159316532@debbugs.gnu.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025; 
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=gZa2ZFnJcb16xMzNzAeVZlEvblhFm7CLAWni5rZgatc=;
	b=VFbbZRY8aizYuPi9VKfVfrfT+XIYV77ZXkBaS/qcB55o7ijD2gtZuTTa1BH1NiBSl3
	3Zqjy39PmOCPVw3nZUz31MXg2ylbJH8VtUp4993YFo2qABqoatP2g3xLSLweWLcbtOmf
	9+oFKqIxWlE4LCQvIFSr29xD/U0y4Egn+WEDKvCcA6QgqXSlC8Ck9n/2ogeRKpNB3KGg
	PWTlG1GXNOcPbdsdQhCHG3LTGb/fLbGJGsjCyGcVlcgrGpSDBT/MvDSQsrgw9iuBVRvh
	U9PoL3EU6ZfIj1hald5tyRAiNpTMXefcUH/tpK6NQaaCleyYiEo4QT3Cz3BtAYH/JKd+
	t3Nw==
In-Reply-To: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
Content-Language: en-US
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/bug-parted>,
	<mailto:bug-parted-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/bug-parted/>
List-Post: <mailto:bug-parted@gnu.org>
List-Help: <mailto:bug-parted-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/bug-parted>,
	<mailto:bug-parted-request@gnu.org?subject=subscribe>
Errors-To: bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org
Sender: "bug-parted" <bug-parted-bounces+gnu-bug-parted-2=m.gmane.org@gnu.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org, 22113@debbugs.gnu.org, bcl@redhat.com

On 05/25/2019 12:01 AM, Metztli Information Technology wrote:
> On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
>>> Niltze [Hello]-
>>>
>>> Just updated Reiser for patch against GNU Parted
>>> git clone git://git.sv.gnu.org/parted.git
>> Uh, it is in upstream already?
> LOL, no.

Ah, no problems anyway..
I'll put the patch to Sourceforge.

Thanks,
Edward.

>
> I just followed Debian maintainer's original advice on updating patch against git branch of GNU Parted.
> < https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >
>
>> Someone must have died ...
> Well, that's the reasoning behind GNU Parted gatekeeper
> < https://www.brianlane.com/about-brian-c-lane/ >
>
> for not merging reiser4 patch.
>
> I just wonder if now that 'Big Blue' acquired Red Hat, the GNU Parted gatekeeper will act in a consistent
> manner and quit his employer on 'ethical and moral' grounds in light of Watson's complicity tainting the company.
> < https://russia-insider.com/en/head-ibm-sympathized-hitler-conducted-census-jews-preparation-camps-russian-tv-news/ri26587 >
> < https://youtu.be/tCBT8H47sZ0 >
> (and/or "Democracy For The Few" by Michael Parenti).
>
> i.e., "...I have absolutely
> no desire to see [IBM]'s work or name do anything but disappear into
> obscurity."
> < http://lists.gnu.org/archive/html/bug-parted/2015-12/msg00008.html >
>
> Well, maybe I quoted him too soon. Unlike Reiser, who is down and dirt-poor and thus all the West 'morally and ethically righteous' developers kick and pile
> scorn onto, 'Big Blue's wealth quells USA technology ecosystem and their employees' ethical and moral sophistry, as is evidenced by, say no issues with JFS,
> for instance.
>
>> Thanks,
>> Edward.
>>
>>> apply patch
>>>
>>> ./bootstrap
>>>
>>> ./configure
>>>
>>> make
>>>
>>> make install
>>>
>>>
>>> Huelmati [Enjoy]!
>>>
>>>




