{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='banksmandiri'}">{l s='Checkout' mod='banksmandiri'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Bank Syariah Mandiri payment' mod='banksmandiri'}
{/capture}

<h2>{l s='Order summary' mod='banksmandiri'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='banksmandiri'}</p>
{else}

<h3>{l s='Bank Syariah Mandiri payment' mod='bankwire'}</h3>
<form action="{$link->getModuleLink('banksmandiri', 'validation', [], true)|escape:'html'}" method="post">
<p>
    <img src="{$this_path_bw}bankwire.jpg" alt="{l s='Bank Syariah Mandiri' mod='banksmandiri'}" style="float:left; margin: 0px 10px 5px 0px;" />
    {l s='You have chosen to pay by Bank Syariah Mandiri.' mod='banksmandiri'}
    <br/><br />
    {l s='Here is a short summary of your order:' mod='banksmandiri'}
</p>
<p style="margin-top:20px;">
    - {l s='The total amount of your order is' mod='banksmandiri'}
    <span id="amount" class="price">{displayPrice price=$total}</span>
    {if $use_taxes == 1}
        {l s='(tax incl.)' mod='banksmandiri'}
    {/if}
</p>
<p>
    -
    {if $currencies|@count > 1}
        {l s='We allow several currencies to be sent via Bank Syariah Mandiri.' mod='banksmandiri'}
        <br /><br />
        {l s='Choose one of the following:' mod='banksmandiri'}
        <select id="currency_payement" name="currency_payement" onchange="setCurrency($('#currency_payement').val());">
            {foreach from=$currencies item=currency}
                <option value="{$currency.id_currency}" {if $currency.id_currency == $cust_currency}selected="selected"{/if}>{$currency.name}</option>
            {/foreach}
        </select>
    {else}
        {l s='We allow the following currency to be sent via Bank Syariah Mandiri:' mod='banksmandiri'}&nbsp;<b>{$currencies.0.name}</b>
        <input type="hidden" name="currency_payement" value="{$currencies.0.id_currency}" />
    {/if}
</p>
<p>
    {l s='Bank Syariah Mandiri account information will be displayed on the next page.' mod='banksmandiri'}
    <br /><br />
    <b>{l s='Please confirm your order by clicking "I confirm my order".' mod='banksmandiri'}</b>
</p>
<p class="cart_navigation" id="cart_navigation">
    <input type="submit" value="{l s='I confirm my order' mod='banksmandiri'}" class="exclusive_large" />
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='banksmandiri'}</a>
</p>
</form>
{/if}