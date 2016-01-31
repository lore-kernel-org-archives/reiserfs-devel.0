From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Debian images on Oracle Compute Cloud Service
Date: Sat, 30 Jan 2016 23:21:53 -0800
Message-ID: <CAM12Q5TTPWVX-sNXYz5zgTA3tYwBd6HuQcske6=+SyR80SZjRQ@mail.gmail.com>
References: <CALdTKe-VK-ir+ondAOrdG=Y=2L9OD_6aXBrAdh9qhgUQOqHk+Q@mail.gmail.com>
	<20160130071111.GD32701@falafel.plessy.net>
	<CALdTKe9JH7gGi78AkCd6x5o=A_g+7byms2gu7H0E9tODYd_2Og@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=DlfFpGFKZltsbQPaxmakJpK+BwEYUdNR7X79Ln6lC84=;
        b=sSTchMOq6Bhrjw/wW75CH9/2pAbFwUft5S/CsqDY+8DCzLNvAqdu1h6o8RBDD0ZfOX
         ksGu7GmHOX9sPfM9Me4a7oDvom0S/zbgfC93OcybdLqmH+/PTsYyBSrCkisgSlNMIbx4
         WNnr9SD6kO+LuBtWr10nwJLqJQfL3/MpiblSDI2gtShnm5dm5VajbGH+vbwqqeoSzSCJ
         s5G2C/KfA+9JnxkgoniRZGspyqyxo4esmX6Zy3i4sKtyoUBo5aPX5/1Lfm2qBM3AUmKY
         2WSoiyVpiKXDt8gvQScgLiUoNKlKl3Deutu+BOgjC2edeZUe3YkmZrWNN0CO3qYdc6N+
         27cA==
In-Reply-To: <CALdTKe9JH7gGi78AkCd6x5o=A_g+7byms2gu7H0E9tODYd_2Og@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tiago Ilieve <tiago.myhro@gmail.com>
Cc: debian-cd@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Sat, Jan 30, 2016 at 1:46 PM, Tiago Ilieve <tiago.myhro@gmail.com> wrote:
> Hi Charles,
>
> I would like to thank you for this absolutely carefully crafted
> message, containing so many important points from the history of
> Debian on cloud platforms. This is even more special when there's no
> secret that you don't have much time available to do something like
> that. I really appreciate.
>
> On 30 January 2016 at 05:11, Charles Plessy <plessy@debian.org> wrote:
>> So here is my personnal opinion: go ahead like it was done at the time the EC2
>> and Google images were done.  Keep people posted here, make them excited, build
>> a community, get feedback, etc.  Just because things can be better later does
>> not mean that they are not good enough now.
>
> Although the images aren't published yet and have only been tested by
> me and a handful employees from Oracle itself (I'm not one of them), I
> do plan do follow the path from James Bromberger and EC2 images:
> posting about them and asking for feedback on "debian-cloud" mailing
> list anytime it is needed.
>
>> Lastly, If you are getting payed that is great.  I think that the goal of the
>> Debian Machine Usage Policies is to prevent unrelated use of our resources.  I
>> can not make scientific computations on the Debian infrastructures with the
>> sole goal of reducing the electricity bill of my research center, for instance.
>> But I do not see why, for performing tasks related to the development of
>> Debian, one could not use our machines while being payed.
>
> This makes total sense. I totally misunderstood what the DMUP meant in
> the fist time.
>
>> So to cut a long story short, I recommend you to document somewhere the
>> difference between the Oracle image and systems prepared by the Debian
>> Installer, and to describe concisely the chain of trust, not only of people but
>> also of hardware, that should convince readers that the images are as pure
>> Debian as possible, and that the possibilty that malwares are introduced
>> together with the necesary changes are minimal.  In my opinion, if there is no
>> competition or challenge within the Oracle cloud about which images should be
>> used by default when somebody wants Debian, then by all means they are
>> official.
>
> A few moments ago I've created[1][2] and edited[3][4] some pages on
> the Debian Wiki to reflect the work I'm doing regarding those images
> for Oracle Compute Cloud Service. It is interesting to notice that
> they do not needed more, but *fewer* modifications than their Azure,
> EC2 and GCE counterparts.
>
> What I observed for the other cloud providers mentioned above, is that
> their images are built by DDs but not necessarily on Debian hardware.
> I still have to found a solution for the custom kernel problem (which
> can possible be resolved using a private repository, but I'll have to
> ask Oracle for it),
Looking forward to how you resolve your 'custom kernel problem', as I
am working on my local branch to somehow add an SSL -enabled
repository for my custom built Reiser4 -patched kernels to include in
bootstrap-vz Debian cloud image creation.

but when this is settled, I'll work with the
> Debian CD team to make this process, like you said, "as official as
> possible".
>
>> Have a nice day.
>
> You too, Charles.
>
>> Charles
>
> Thanks again,
> Tiago.
>
> P.s.: I've found the bug #706052[5] reported by you nearly 3 years
> ago, regarding the intention of documenting the requirements for an
> image to be called Debian. The references about the agreement made
> between the teams involved on the Azure naming discussion were sent to
> it.
>
> [1]: https://wiki.debian.org/OracleCompute
> [2]: https://wiki.debian.org/Cloud/OracleComputeImage
> [3]: https://wiki.debian.org/Cloud
> [4]: https://wiki.debian.org/Cloud/SystemsComparison
> [5]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=706052
>
> --
> Tiago "Myhro" Ilieve
> Blog: https://blog.myhro.info/
> GitHub: https://github.com/myhro
> LinkedIn: https://br.linkedin.com/in/myhro
> Montes Claros - MG, Brasil
>


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
