/*
 * Copyright (c) 2022-present Charles7c Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package top.charles7c.cnadmin.webapi.controller.common;

import java.util.List;

import lombok.RequiredArgsConstructor;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.tags.Tag;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import top.charles7c.cnadmin.common.model.vo.R;
import top.charles7c.cnadmin.common.util.validate.ValidationUtils;
import top.charles7c.cnadmin.monitor.annotation.Log;
import top.charles7c.cnadmin.monitor.model.vo.DashboardAccessTrendVO;
import top.charles7c.cnadmin.monitor.model.vo.DashboardGeoDistributionVO;
import top.charles7c.cnadmin.monitor.model.vo.DashboardPopularModuleVO;
import top.charles7c.cnadmin.monitor.model.vo.DashboardTotalVO;
import top.charles7c.cnadmin.monitor.service.DashboardService;
import top.charles7c.cnadmin.system.model.vo.DashboardAnnouncementVO;

/**
 * 仪表盘 API
 *
 * @author Charles7c
 * @since 2023/1/22 21:48
 */
@Tag(name = "仪表盘 API")
@Log(ignore = true)
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class DashboardController {

    private final DashboardService dashboardService;

    @Operation(summary = "查询总计信息", description = "查询总计信息")
    @GetMapping("/total")
    public R<DashboardTotalVO> getTotal() {
        return R.ok(dashboardService.getTotal());
    }

    @Operation(summary = "查询访问趋势信息", description = "查询访问趋势信息")
    @Parameter(name = "days", description = "日期数", example = "30", in = ParameterIn.PATH)
    @GetMapping("/access/trend/{days}")
    public R<List<DashboardAccessTrendVO>> listAccessTrend(@PathVariable Integer days) {
        ValidationUtils.throwIf(7 != days && 30 != days, "仅支持查询近 7/30 天访问趋势信息");
        return R.ok(dashboardService.listAccessTrend(days));
    }

    @Operation(summary = "查询热门模块列表", description = "查询热门模块列表")
    @GetMapping("/popular/module")
    public R<List<DashboardPopularModuleVO>> listPopularModule() {
        return R.ok(dashboardService.listPopularModule());
    }

    @Operation(summary = "查询访客地域分布信息", description = "查询访客地域分布信息")
    @GetMapping("/geo/distribution")
    public R<DashboardGeoDistributionVO> getGeoDistribution() {
        return R.ok(dashboardService.getGeoDistribution());
    }

    @Operation(summary = "查询公告列表", description = "查询公告列表")
    @GetMapping("/announcement")
    public R<List<DashboardAnnouncementVO>> listAnnouncement() {
        return R.ok(dashboardService.listAnnouncement());
    }
}