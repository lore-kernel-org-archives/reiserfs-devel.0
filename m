From: Byron Stanoszek <gandalf@winds.org>
Subject: Re: Is it time to remove reiserfs?
Date: Fri, 25 Feb 2022 08:10:22 -0500 (EST)
Message-ID: <257dc4a9-dfa0-327e-f05a-71c0d9742e98@winds.org>
References: <YhIwUEpymVzmytdp@casper.infradead.org> <20220222100408.cyrdjsv5eun5pzij@quack3.lan> <20220222221614.GC3061737@dread.disaster.area> <3ce45c23-2721-af6e-6cd7-648dc399597@winds.org> <YhfzUc8afuoQkx/U@casper.infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <YhfzUc8afuoQkx/U@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Dave Chinner <david@fromorbit.com>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, 24 Feb 2022, Matthew Wilcox wrote:
> On Wed, Feb 23, 2022 at 09:48:26AM -0500, Byron Stanoszek wrote:
>> For what it's worth, I have a number of production servers still using
>> Reiserfs, which I regularly maintain by upgrading to the latest Linux kernel
>> annually (mostly to apply security patches). I figured this filesystem would
>> still be available for several more years, since it's not quite y2038k yet.
>
> Hey Byron, thanks for sharing your usage.
>
> It's not entirely clear to me from your message whether you're aware
> that our annual LTS release actually puts out new kernels every week (or
> sometimes twice a week), and upgrades to the latest version are always
> recommended.  Those LTS kernels typically get five years of support in
> total; indeed we just retired the v4.4 series earlier this month which
> was originally released in January 2016, so it got six years of support.
>
> If we dropped reiserfs from the kernel today (and thanks to Edward, we
> don't have to), you'd still be able to use a v5.15 based kernel with
> regular updates until 2028.  If we drop it in two years, that should
> take you through to 2030.  Is that enough for your usage?

I'm aware of the LTS releases, but I hadn't thought about them in relation to
this issue. That's a good point, and so it sounds like I have nothing to worry
about.

Thanks for the recommendation.

Regards,
  -Byron

