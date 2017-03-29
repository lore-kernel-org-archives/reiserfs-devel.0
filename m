From: Steve McIntyre <steve@einval.com>
Subject: Bug#858849: installation-reports: Successful Jessie installation with backported kernel 4.9.16-1+reiser4.0.1 on i915 system AMD64
Date: Wed, 29 Mar 2017 17:46:33 +0100
Message-ID: <20170329164633.GE1983@einval.com>
References: <20170327163053.8989.51286.reportbug@xiuhcohuatl.metztli-it.com>
 <20170328030000.GC27809@mraw.org>
 <CAM12Q5QoPtqyE7V0oshZRQOraVJV-82PrYFhytNfwRNBoaRA9g@mail.gmail.com>
 <20170329154839.GE17320@mraw.org>
 <CAM12Q5TtciuHO-mPiyXE6E_WmvVM_A5N_fxrYVbqZdrCUSxcXQ@mail.gmail.com>
Reply-To: Steve McIntyre <steve@einval.com>, 858849@bugs.debian.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.858849.B858849.149080603414293@bugs.debian.org>
Content-Disposition: inline
In-Reply-To: <CAM12Q5TtciuHO-mPiyXE6E_WmvVM_A5N_fxrYVbqZdrCUSxcXQ@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-bugs-dist/>
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="utf-8"
To: Jose R R <jose@metztli-it.com>, 858849@bugs.debian.org
Cc: Cyril Brulebois <kibi@debian.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi,

On Wed, Mar 29, 2017 at 09:27:42AM -0700, Jose R R wrote:
>On Wed, Mar 29, 2017 at 8:48 AM, Cyril Brulebois <kibi@debian.org> wrote:
>> Jose R R <jose@metztli-it.com> (2017-03-29):
>>
>>> "We also encourage installation reports to be sent even if the
>>> installation is successful, so that we can get as much information as
>>> possible on the largest number of hardware configurations." <
>>> https://www.debian.org/releases/stable/amd64/ch05s04.html.en#submit-bug
>>> >
>>
>> Sure, with official images.
>>
>>> If you are still 'bothered' with my sporadic submissions, I encourage
>>> you to modify the documentation to specifically exclude the glaring
>>> omission.
>>
>> I could be adding a specific “we don't need reiser4-specific reports”
>
>Please do add that phrase; thus removing any ambiguities and cover the
>glaring omission in the Debian documentation.

It's hardly a "glaring omission" that we don't list *explicitly*:

 * we don't want reiser4-specific reports
 * we don't want Ubuntu installation reports
 * we don't want installation reports about other modified images

You're reading the "Installation Guide for Debian", not the
"Installation Guide for every unofficial user-modified version of
Debian". The docs are meant to describe how to install Debian using
Debian's installer - is that not obvious?

>That clarification will prevent other individuals -- who have
>downloaded the netboot installer from SourceForge -- from potentially
>reporting via the debian mechanism -- once the installation completes.
>
>Additionally, appending “we don't need reiser4-specific reports” will
>be a welcome *explicit* change in policy from other FOSS projects,
>like GNU Parted, where the unspoken censorship on reiser4 bites anyone
>who submits patches in support of the
>'Batman Machine': Reiser4
>< https://metztli.it/readOnlyEphemeral/Batman_Machine-Reiser4.pdf >

I understand that you're working on reiser4 stuff and you'd like to
publicise it - that's cool and I hope it's working well for you! But
spamming us here is *not* helping. OK?
