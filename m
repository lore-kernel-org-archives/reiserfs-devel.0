From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Fwd: bug#22113: Initial Reiser4 patch for Parted
Date: Fri, 11 Dec 2015 17:38:48 +0100
Message-ID: <566AFC18.7090102@gmail.com>
References: <CAM12Q5QDp__EAjLUEUbmyFFm1ap=uQrF2Od_S5ZBg6NnOL2ZAg@mail.gmail.com>
 <20151208185941.GR2772@lister.brianlane.com>
 <CAM12Q5Tewr2RgAd_+MdoAVU73v8Lu69asPKuMMzk=ZZNJgNNiw@mail.gmail.com>
 <5667FBF9.70107@gmail.com> <20151210162146.GC2721@lister.brianlane.com>
 <CAM12Q5QSVfbTsQH9h6prNvWmge_YRM6zJPS=eGPa9qqKC=LA9w@mail.gmail.com>
 <CAM12Q5Tq8XF1YooU-mrJOcHMK9EYJTn1SmYo9enB0-2t6PFs3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=8aDQgfngRJ9SsHk5684p22W2p7tTnqFNIkhzQPT7K+k=;
        b=u5fbnMSRBU7yEZM2hhTx4FuEKUp7Tc0fzBvtVn9dJ+baG/7SsmRSTPavhrqhfh7pDW
         dXEv5buu/RyDjDRMnKJMwalMUWoYVpTotqjf5TYo4YDbemXzEIaqtFCw2c5/8GAVWk1C
         fs4j3MgEyEyXPLuNjCURTtMtJda1ZiOgPMMepOuj5BKp8qCrmRR4OgMY+/QKza3fNbcq
         0YJBv9JYBGoenKr/QaIt3jXQUmSAdLXUnlxCzy6B1ecV4/iOAf8iCIvyN8E9Rag/zL9H
         7BKZw1eDuGjQxUk/jkL83o4XVCsalkD+qlWPojnleU1CmWR5FwV8Ewka0jBaByMuHIjq
         tJBA==
In-Reply-To: <CAM12Q5Tq8XF1YooU-mrJOcHMK9EYJTn1SmYo9enB0-2t6PFs3g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose R R <Jose.r.r@metztli-it.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


What can I say...

Of course, we can complain to RMS, but they will find a reason to not
include it...
I have uploaded your patch here:
https://sourceforge.net/projects/reiser4/files/patches
This is for distributions who maintain their own forks of GNU parted.

Thanks!
Edward.


On 12/11/2015 02:35 AM, Jose R R wrote:
> ---------- Forwarded message ----------
> From: Jose R R <jose.r.r@metztli.com>
> Date: Thu, Dec 10, 2015 at 5:15 PM
> Subject: Re: bug#22113: Initial Reiser4 patch for Parted
> To: 22113@debbugs.gnu.org
> Cc: Edward Shishkin <edward.shishkin@gmail.com>
>
>
> On Thu, Dec 10, 2015 at 8:21 AM, Brian C. Lane <bcl@redhat.com> wrote:
>> On Wed, Dec 09, 2015 at 11:01:29AM +0100, Edward Shishkin wrote:
>>> I wouldn't refer en.wikipedia.org/wiki/Reiser4 as "homepage":
>>> this resource is completely unmoderated.
>>> The actual stuff about reiser4 can be found here:
>>> https://reiser4.wiki.kernel.org
>> Thanks for the correction. I'm still not interested. I have absolutely
>> no desire to see Reiser's work or name do anything but disappear into
>> obscurity.
> Then, for the sake of not making other potential Reiser4 contributors
> lose their time -- falsely believing in the technical meritocracy of
> FOSS -- I suggest that you place the above statement at the GNU Parted
> site.
>
> Last I read (< http://www.gnu.org/software/parted/ >) *before
> submitting my Reiser4 patch* I could not find a notice *explicitly*
> stating that Reiser4 work is not to be evaluated on its technical
> merits but rather on a personal  'morality', religious fanaticism,
> and/or subjective 'altruism' and/or prejudice. I even checked for the
> relevant 'Reiser' string at the development site (<
> http://savannah.gnu.org/projects/parted/ >) with NULL results.
>
> Notwithstanding, selectively applying a personal subjective criteria
> to Reiser4 and not, say JFS for instance, seems more of a
> contradictory attitude --as code contributions from organizations with
> exponentially darker backgrounds (<
> http://listverse.com/2013/10/24/10-big-business-nazi-profiteers/ >)
> than Reiser are included -- specifically in Parted -- without
> compunction.
>
>
> Best Professional Regards.
>
> --
> Jose R R
> http://metztli.it

